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


def doAllTrucks():
    """ Run through all the trucks and try to update them all """

    with conn.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
        cur.execute("SELECT * FROM trucks;")

        for truck in cur:
            print truck['twitname']
            print truck['name']
            getUpdate(truck)


def doTruck(twitterHandle):
    """ Given the truck name update just this one """

    with conn.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
        cur.execute("SELECT * FROM trucks WHERE twitname = '" + twitterHandle + "';")
        for truck in cur:
            print truck['twitname']
            print truck['name']
            getUpdate(truck)


def getUpdate(truck):
    """ Get the information on the given truck and update the db """

    twitName = truck['twitname']
    truckId = truck['id']
    address = ""

    try:
        custom = __import__('trucks.' + twitName, fromlist=[twitName])
        c = getattr(custom, twitName)
        address = c().job()
    except ImportError:
        print "No Special Class"
    except AttributeError:
        print "Something wrong with class"
    except IOError:
        print "Website 404!!!!"

    print address

    tweets = getTweets(twitName)
    if not tweets is None:  # Make sure we have a list of tweets
        tweet = None

        if address:
            tweet = compareToTweet(address, tweets)

        if not tweet:
            try:
                regex = truck['regex']
            except KeyError:
                regex = None
            try:
                matcher = truck['matcher']
            except KeyError:
                matcher = None
            tweet = getAddressFromTweet(regex, matcher, tweets)
            if tweet:
                address = tweet['address']

        if tweet:
            region = getRegion(address, tweet['contents'])
            print {"id" : truckId, "location": address,
                   "lastupdate": int(tweet['time']),
                   "tweet": tweet['contents'],
                   "region": region['section'],
                   "street": region['street'],
                   "retweeted": tweet['retweeted'],
                   "lasttweet" : tweets[0]['time']}
            saveCursor.execute(
                """UPDATE trucks SET location = (%(location)s), 
                lastupdate = (%(lastupdate)s), tweet = (%(tweet)s),
                region = (%(region)s), street = (%(street)s),
                retweeted = (%(retweeted)s), lasttweet = (%(lasttweet)s)
                WHERE id = (%(id)s);""", 
                {'id' : truckId, 'location': address, 'lastupdate' : int(tweet['time']) ,
                'tweet' : tweet['contents'], 'region' : region['section'], 
                'street' : region['street'], 'retweeted' : tweet['retweeted'],
                'lasttweet' : tweets[0]['time']})
        else:
            try:
                saveCursor.execute(
                    """UPDATE trucks SET lasttweet = (%(time)s) WHERE id = (%(id)s);""",
                    {'time': tweets[0]['time'], 'id': truckId})
            except IndexError:
                print "Truck has not tweeted"
            print "Not Updated"


def compareToTweet(address, tweets):
    """ Compare an address with tweets return the matched tweet dict.

    Keyword arguments:
    address -- the address to compare
    tweets -- a list of tweets from the api

    """
    streetRegex = re.compile("[0-9][0-9]", re.I)  # This is bad.

    match = re.search(streetRegex, address)

    tokens = nltk.word_tokenize(re.sub("st.?", "",
                                address.replace("/", " "), 0, re.I))
    tags = nltk.pos_tag(tokens)
    tagdict = findtags('NNP', tags)

    streetNum = ""
    if(match):
        streetNum = match.group()

    epochMinus8Hours = int(time.time()) - datetime.timedelta(hours=8).total_seconds()

    for tweet in tweets:
        if int(tweet['time']) > epochMinus8Hours \
                and not tweet['contents'][0] == "@" \
                and not "tomorrow" in tweet['contents']:
            match = re.search(streetRegex, tweet['contents'])
            tweetSt = ""
            if match:
                tweetSt = match.group()
            # Make sure today's tweet has the same street
            if not streetNum == "" and tweetSt == streetNum:
                return tweet
            elif streetNum == "":
                allTags = True
                try:
                    for w in tagdict['NNP']:
                        if not w.lower() in tweet['contents'].lower():
                            allTags = False
                    if allTags:
                        return tweet
                except KeyError:
                    print "No nouns"
                    return None
    return None


def getRegion(address, contents):
    """ Get the region in NYC the truck is in 
    
    Keyword arguments:
    address -- the address the truck is currently at
    contents -- the entire contents of the tweet from the truck   
 
    """

    address = re.sub("https?:\/\/\S+", "", address)
    contents = re.sub("https?:\/\/\S+", "", contents)

    region = {'section': "none", 'street': "none"}

    qns = re.search("(astoria|astorians)", contents, re.I)
    if qns:
        region = {'street': qns.group(0), 'section': "qns"}
        return region

    downtown = re.search("(old slip|wfc|water.*broad|soho|brookfieldplny|fidi|varick|brookfieldplny|hanover|starrett?.?lehigh|vesey|pier 36|wall)", address, re.I)
    if downtown:
        region = {'street': downtown.group(0), 'section': "none"}
        return region

    brooklyn = re.search("(bklyn|brooklyn|(pearl|washington|front|water|jay|main).*(front|jay|water|main)|dumbo|beckman|bedford|bushwick|industry ?city|industrycity)", address, re.I)
    if brooklyn:
        region = {'street': brooklyn.group(0), 'section': "bkl"}
        return region

    uptown = re.search("(columbia( university)?|((^|[^0123456789])(3[4-9]|[4-9][0-9]|1[0-3][0-9])([^\-:a0123456789]|$|and)|[^0-9]1[0-9]{2}([^0-9]]|$))|queens college)", address, re.I)
    if uptown:
        region = {'street': re.sub("\D", "", uptown.group(0)), 'section': "up"}
        return region

    midtown = re.search("(^|[^0123456789])(3[1-3]|[1-2][0-9])([^-:a0123456789]|$)", address, re.I)
    if midtown:
        region = {'street': re.sub("\D", "", midtown.group(0)), 'section': "mid"}

    return region


def getAddressFromTweet(regex, matcher, tweets):
    """
    Get the truck location from twitter return the tweet address dict

    Keyword arguments:
    regex -- the custom regex for this truck
    matcher -- if the truck requires a word to be in the tweet
    tweets -- list of tweets from api

    """
    checkingRegex = re.compile("(( |^|\n|w|@)([0-9]{1,3}(nd|th|rd|ave|st)? |adams|amsterdam|atlantic|beckman|bedford|beaver|bleec?ker|bridge|broad|broadwa?y|b'way|bdway|bway|bdwy|(north|n.?) brunswick|canal|charlton|columbus|court|ditmars|fletcher|front|fulton|greenwich|gouverneur|goveneur|grand|greene|hanover|(w.? )?houston|howard|hudson|jay|john|kings?|lafayette|lex|lexington|liberty|lincoln|maiden|mad[^a-z]|madison|madosin|main|mercer|murray|murray hill|(north|n.?) ?end|ocean|old slip|park[^a-z]|pearl|pine|prince|radison|south end|spring|starrett?.?lehigh|vanderbilt|var?ndam|varicks?|vess?ey|wall|washington|water|waverly|west|whitehall|william|york)([^-]*?)(and?|at|between|bw|\+|n|btwn|\/|&|btw.?|bwtn|bet|b\/w|@|b\/t|facing|facing towards|off|near|nr|\()@? ?([0-9]{1,3}(nd|th|rd|ave|st)?|adams|amsterdam|atlantic|beckman|bedford|beaver|bleec?ker|bridge|broad|broadwa?y|b'way|bdway|bway|bdwy|(north|n.?) brunswick|canal|charlton|columbus|court|ditmars|fletcher|front|fulton|greenwich|gouverneur|goveneur|grand|greene|hanover|(w.? )?houston|howard|hudson|jay|john|kings?|lafayette|lex|lexington|liberty|lincoln|maiden|mad|madison|madosin|main|mercer|murray|murray hill|(north|n.?) ?end|ocean|old slip|park|pearl|pine|prince|radison|south end|spring|starrett?.?lehigh|vanderbilt|var?ndam|varicks?|vess?ey|wall|washington|water|waverly|west|whitehall|william|york)(?! price) ?(st.?|street|ave?|avenue|la?ne?|blvd)? ?(and?|at|between|bw|\+|n|btwn|\/|&|btw.?|bwtn|bet|b\/w|@|b\/t|facing|facing towards|off|near|nr|\()?@? ?([0-9]{1,3}(nd|th|rd|ave|st)?|adams|amsterdam|atlantic|beckman|bedford|beaver|bleec?ker|bridge|broad|broadwa?y|b'way|bdway|bway|bdwy|(north|n.?) brunswick|canal|charlton|columbus|court|ditmars|fletcher|front|fulton|greenwich|gouverneur|goveneur|grand|greene|hanover|(w.? )?houston|howard|hudson|jay|john|kings?|lafayette|lex|lexington|liberty|lincoln|maiden|mad|madison|madosin|main|mercer|murray|murray hill|(north|n.?) ?end|ocean|old slip|park|pearl|pine|prince|radison|south end|spring|starrett?.?lehigh|vanderbilt|var?ndam|varicks?|vess?ey|wall|washington|water|waverly|west|whitehall|william|york)? ?(and?|at|between|bw|\+|n|btwn|\/|&|btw.?|bwtn|bet|b\/w|@|b\/t|facing|facing towards|off|near|nr|\()?@? ?([0-9]{1,3}(nd|th|rd|ave|st)?|adams|amsterdam|atlantic|beckman|bedford|beaver|bleec?ker|bridge|broad|broadwa?y|b'way|bdway|bway|bdwy|(north|n.?) brunswick|canal|charlton|columbus|court|ditmars|fletcher|front|fulton|greenwich|gouverneur|goveneur|grand|greene|hanover|(w.? )?houston|howard|hudson|jay|john|kings?|lafayette|lex|lexington|liberty|lincoln|maiden|mad|madison|madosin|main|mercer|murray|murray hill|(north|n.?) ?end|ocean|old slip|park|pearl|pine|prince|radison|south end|spring|starrett?.?lehigh|vanderbilt|var?ndam|varicks?|vess?ey|wall|washington|water|waverly|west|whitehall|william|york)?|coney island ave|brookfieldplny|world finan?cial center|wfc|world ?financial ?center|wfcfoodtrucks|union square west|union sq|starrett?.?lehigh|pier.94|hanover.square|dumboLot|columbia university|south street seaport|queens college|south end ave|industrycity|60 wall|dumbofoodtrucks|@?columbia|brooklyn college|pier 36|wall st)", re.I)
    epochMinus8Hours = int(time.time()) - datetime.timedelta(hours=8).total_seconds()
    today = date.today().strftime("X%m/X%d/%y").replace('X0', 'X').replace('X', '')
    today2 = date.today().strftime("X%m/X%d").replace('X0', 'X').replace('X', '')
    today3 = date.today().strftime("%b X%dth").replace('X0', 'X').replace('X', '')


    for tweet in tweets:
        contents = tweet['contents']
        if regex:  # for twitters with 2 trucks
            truckRegex = re.compile(regex, re.I)
            m = re.search(truckRegex, contents)
            if m:
                contents = tweet['contents'][m.start():m.end()]
            else:
                continue
        contents = re.sub(today, "", contents)
        contents = re.sub(today2, "", contents)
        contents = re.sub(today3, "", contents)
        contents = re.sub("at the corner of", "and", contents)
        #remove twitter urls
        with open('simpleWords', 'r') as f:
            for word in f:
                contents = re.sub(word.strip(), "", contents, flags=re.I)
        contents = re.sub("http:\/\/t.co\/[a-z0-9A-Z]*", "", contents)
        contents = contents.replace("~", " ")
        contents = contents.replace("  ", " ")
        contents = contents.replace(",", " ")
        contents = contents.replace(".", " ")
        contents = contents.replace("\n", " ")
        contents = contents.replace("(", " ")
        contents = contents.replace(")", " ")
        contents = contents.replace("-- ", "")
        contents = re.sub("[0-9]{2}(am?|\:[0-9]{1,2})?\ ?- ?[0-9](pm?|\:[0-9]{1,2})?", " ", contents)  # times
        hasPunct = True
        while hasPunct:
            punct = re.search("[^ ](\/|&|\+|\-)[^ ]", contents)  #add spaces around punctuation
            if punct:
                contents = contents[:punct.start()+1] + " " + contents[punct.start()+1:punct.end()-1] + " " + contents[punct.end()-1:]
            else:
                hasPunct = False

        contents = re.sub("@brookfieldplny", "brookfieldplny", contents, 0, re.I)
        contents = re.sub("@dumbolot", "dumbolot", contents, 0, re.I)
        contents = re.sub("@downtownlunch", "downtownlunch", contents, 0, re.I)
        contents = re.sub("@midtownlunch", "midtownlunch", contents, 0, re.I)
        if matcher:
           matcherRegex = re.compile(matcher, re.I)
        if int(tweet['time']) > epochMinus8Hours  \
           and len(contents) > 0 \
           and not contents[0] == "@" \
           and not re.match("tomorrow", contents, re.I) \
           and not re.match(".*taking (the)? day off", tweet['contents'], re.I) \
           and not re.match(".*will not be coming out", tweet['contents'], re.I) \
           and not re.match(".*off the road (due to the weather )?today", tweet['contents'], re.I) \
           and (not matcher or re.search(matcherRegex, contents)):
            # if truck has BSON amount of trucks (2) then make sure to
            # get both the trucks and if the truck has more than 1 match
            match = re.search(checkingRegex, contents)
            if match:
                tweet['address'] = contents[match.start():match.end()]
                return tweet
    return None


def getTweets(twitName):
    """
    Get the latest tweets by scraping, return list of tweet dict

    Keyword arguments:
    twitName -- the twitter name to get tweets from

    """
    scrapedTweets = []
    try:
        resp = twit.statuses.user_timeline(screen_name=twitName, count=20, exclude_replies=0)
    except TwitterHTTPError:
        print "error getting tweets"
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
                    {'id' : tweet['id'], 'contents' : unicodedata.normalize('NFKD', tweet['text']).encode('ascii', 'ignore'), 
                    'time' : t['time'], 'retweeted' : tweet['retweeted'], 'twitname' : twitName})
        except psycopg2.IntegrityError:
            print "duplicate"
            saveCursor.rollback()

        if t['contents'][0:2] == "RT":  # actually get retweets, whaaa
            t['retweeted'] = True
        if t['contents'][0:13] == "RT @NYCParks:":  # no! just no
            t['contents'] = " "
        scrapedTweets.append(t)

    return scrapedTweets


def findtags(tag_prefix, tagged_text):
    cfd = nltk.ConditionalFreqDist((tag, word) for (word, tag) in tagged_text if tag.startswith(tag_prefix))
    return dict((tag, cfd[tag].keys()[:5]) for tag in cfd.conditions())

if len(sys.argv) > 1:
    doTruck(sys.argv[1])
else:
    doAllTrucks()

conn.commit()
saveCursor.close()
conn.close()
