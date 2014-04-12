from twitter import *
import unicodedata

CONSUMER_KEY = 'UB43K7ratVLqTLWFCg8HA'
CONSUMER_SECRET = 'SxOaVGoPh416L3V3q8qbgH8JKVInj8gNzMVBylNW3qs'
ACCESS_TOKEN = '10257692-V0Dv2KamuENV6QhKYbAAtmkqtzcsVpC4Aud5GLjLA'
ACCESS_TOKEN_SECRET = 'tbW0PnCPi1odz7QJxyxkFKSR6fUkYGuxLfpqorr09c'

f = open('myfile', 'w')

t = Twitter(auth=OAuth(ACCESS_TOKEN, ACCESS_TOKEN_SECRET,
                       CONSUMER_KEY, CONSUMER_SECRET))

resp = t.statuses.user_timeline(screen_name="veganlunchtruck", count=200, exclude_replies=1)
format = "%a %b %d %H:%M:%S +0000 %Y"

for tweet in resp:
    print tweet
    text = unicodedata.normalize('NFKD', tweet['text']).encode('ascii', 'ignore').replace("&amp;", "&")
    try:
        f.write(text+'\n\n')
    except:
        print "unicode error"
