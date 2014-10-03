#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Get information for trucks.
# python 2.7

from datetime import date
import datetime
import nltk
import re
import sys
import time
from twitter import *
import unicodedata
import psycopg2
import psycopg2.extras

CONSUMER_KEY = 'UB43K7ratVLqTLWFCg8HA'
CONSUMER_SECRET = 'SxOaVGoPh416L3V3q8qbgH8JKVInj8gNzMVBylNW3qs'
ACCESS_TOKEN = '10257692-V0Dv2KamuENV6QhKYbAAtmkqtzcsVpC4Aud5GLjLA'
ACCESS_TOKEN_SECRET = 'tbW0PnCPi1odz7QJxyxkFKSR6fUkYGuxLfpqorr09c'
TWEET_TIME_FORMAT = "%a %b %d %H:%M:%S +0000 %Y"

twit = Twitter(
    auth=OAuth(ACCESS_TOKEN, ACCESS_TOKEN_SECRET,
               CONSUMER_KEY, CONSUMER_SECRET)
)

conn = psycopg2.connect("dbname=foodtruck")
saveCursor = conn.cursor()


class Location:
    """ A location that was matched inside a tweet. """
    def __init__(self, id, location):
        self.id = id
        self.location = location

    def __repr__(self):
        return repr((self.id, self.location))


def doAllTrucks():
    """ Run through all the trucks and try to update them all """

    with conn.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
        cur.execute("SELECT DISTINCT twitname FROM trucks")

        # Get all tweets first
        for twitname in cur:
            getTweetsFromTwitter(twitname[0])

        cur.execute("SELECT * FROM trucks;")

        # Update site Data
        for truck in cur:
            print truck['twitname']
            print truck['name']
            search(truck)


def doTruck(twitterHandle):
    """ Given the twitter find all trucks associated in the db
    and update them.

    Keyword arguments:
    twitterHandle -- The truck's twitter

    """

    with conn.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
        cur.execute("SELECT * FROM trucks WHERE twitname = '" + twitterHandle + "';")
        for truck in cur:
            print truck['twitname']
            print truck['name']
            getTweetsFromTwitter(truck['twitname'])
            search(truck)


def findLocations(contents):
    """ Search the contents of a tweet for an address

    Keyword arguments:
    contents -- a cleaned tweet

    """
    locations = []
    with conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor) as cur:
        cur.execute("SELECT * from locations;")

        for location in cur:
            searchResult = re.search(location['matcher'], contents, re.I)
            if searchResult:
                locations.append(Location(location['id'], searchResult))

    return locations


def cleanTweet(contents):
    """ Run through the substitutions table and clean the tweet

    Keyword arguments:
    contents -- contents of a dirty tweet

    """
    with conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor) as cur:
        cur.execute("SELECT * from subs;")
        for sub in cur:
            contents = re.sub(sub['regex'], sub['replacement'], contents, flags=re.I)

    return contents


def search(truck):
    """ Get the tweets for a truck from the database and if the tweet shouldn't
    be skipped clean the tweet and find the location. If a location is found
    save it to the database.

    Keyword arguments:
    twitname -- the twit name of the truck to find a location of

    """
    epochMinus8Hours = int(time.time()) - datetime.timedelta(hours=8).total_seconds()
    tomorrow = (datetime.date.today() + datetime.timedelta(days=1)).strftime("X%m/X%d").replace('X0', 'X').replace('X', '')

    with conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor) as cur:
        cur.execute("SELECT * from tweets WHERE twitname = '" + truck['twitname'] + "' order by time desc;")
        tweets = cur.fetchall()

    for tweet in tweets:
        contents = tweet['contents']
        # Skip tweets that have tomorrow's date in them
        hasTomorrow = re.search(tomorrow, contents)
        if hasTomorrow or re.search("tomorrow", contents):
            print "that tweet is happening tomorrow"
            continue

        # This is a list of the future!
        if re.search('(tue|tues)', contents, flags=re.I) \
            and re.search('wed', contents, flags=re.I) \
                and re.search('(thu|thurs)', contents, flags=re.I):
                    print "that tweet is a list"
                    continue

        # If we got into tweets that are too old
        if int(tweet['time']) < epochMinus8Hours:
            print "too old"
            break

        # If the tweet must contain a matcher
        if truck['matchmethod'] == "contains":
            if not methodContains(contents, truck['matcher']):
                continue

        contents = cleanTweet(contents)
        location = False
        locations = findLocations(contents)
        if len(locations) == 1:
            if truck['matchmethod'] == "two":
                if int(truck['matcher']) == 1:
                    location = locations[0]
                else:
                    break
            else:
                location = locations[0]
        elif len(locations) > 1:
            if truck['matchmethod'] == "before":
                location = methodBefore(contents, truck['matcher'], locations)
            elif truck['matchmethod'] == "two":
                location = locations[int(truck['matcher']) - 1]
            else:
                location = locations[0]
                print "Many addresses, no match method"

        if location:
            saveCursor.execute(
                """UPDATE trucks SET loc = (%(location)s),
                lastupdate = (%(lastupdate)s), tweet = (%(tweet)s)
                WHERE id = (%(id)s);""",
                {
                    'id': truck['id'],
                    'location': location.id,
                    'lastupdate': int(tweet['time']),
                    'tweet': tweet['contents']
                })
            break


def methodBefore(tweet, matcher, locations):
    """ For twitters that facility multiple trucks.
    Find the matcher before the location and that's your correct location.

    Keyword arguments:
    tweet -- tweet with the locations
    matcher -- what to find before the location
    locations -- all locations found in tweet

    """

    for location in locations:
        matchFound = re.search(matcher, tweet, re.I)
        if matchFound and matchFound.start() < location.location.start():
            return location

    return False


def methodContains(tweet, matcher):
    """  For twitters that just name which truck is attached to the address
    they tweeted. If the tweet contains the matcher.

    Keyword arguments:
    tweet -- tweet with the location
    matcher -- the text to match inside the tweet

    """

    if re.search(matcher, tweet, re.I):
        return True
    else:
        return False


def getTweetsFromTwitter(twitName):
    """
    Store the latest tweets into the database

    Keyword arguments:
    twitName -- the twitter name to get tweets from

    """
    scrapedTweets = []
    try:
        resp = twit.statuses.user_timeline(screen_name=twitName, count=20, exclude_replies=0)
    except TwitterHTTPError:
        print "error getting tweets " + twitName
        return None

    for tweet in resp:
        t = {}
        contents = unicodedata.normalize('NFKD', tweet['text']).encode('ascii', 'ignore')  # Fix unicode
        contents = contents.replace("&amp;", "&")
        contents = contents.replace("#", "")
        contents = contents.replace('"', "")
        t['contents'] = contents
        t['time'] = int(time.mktime(time.strptime(tweet['created_at'], TWEET_TIME_FORMAT)))
        t['id'] = tweet['id']
        t['retweeted'] = tweet['retweeted']
        try:
            saveCursor.execute(
                """INSERT INTO tweets (id, contents, time, retweeted, twitname) SELECT
                    %(id)s, %(contents)s, %(time)s, %(retweeted)s, %(twitname)s WHERE NOT EXISTS (
                        SELECT 1 FROM tweets WHERE id=%(id)s);""",
                    {
                        'id': tweet['id'],
                        'contents': t['contents'],
                        'time': t['time'],
                        'retweeted': tweet['retweeted'],
                        'twitname': twitName
                    })
        except psycopg2.IntegrityError:
            print "duplicate"
            saveCursor.rollback()

        if t['contents'][0:2] == "RT":  # actually get retweets, whaaa
            t['retweeted'] = True
        if t['contents'][0:13] == "RT @NYCParks:":  # no! just no
            t['contents'] = " "
        scrapedTweets.append(t)

    return scrapedTweets

if len(sys.argv) > 1:
    doTruck(sys.argv[1])
else:
    doAllTrucks()

conn.commit()
saveCursor.close()
conn.close()
