# Bian Dang food truck schedule grab
# python 2.7

from urllib import urlopen
from bs4 import BeautifulSoup
import datetime
import time
import re

class bigdsgrub:

    def job(self):
        streetRegex = re.compile("[0-9][0-9]", re.I)
        urlObject = urlopen("http://bigdsgrub.com/")

        now = datetime.datetime.now() 
        monday = now - datetime.timedelta(days=now.weekday())
        date = "%d/%d" % (monday.month, monday.day) #This is how you remove leading zeroes on a date! yay!
        dayName = now.strftime('%A')

        soup = BeautifulSoup(urlObject.read())

        webTweets = soup.find("ul", { "class" : "really_simple_twitter_widget"}).find_all('li')

        place = ""
        location = ""

        for item in webTweets:
          if(item.contents[0]).find(date) != -1:
            if(dayName == "Monday"):
              place = re.search("Mon:.*?\/", item.contents[0])
              location = place.group(0).replace("/", "").replace("Mon: ", "") #formatted
            elif(dayName == "Tuesday"):
              place = re.search("Tues:.*?\/", item.contents[0])
              location = place.group(0).replace("/", "").replace("Tues: ", "")
            elif(dayName == "Wednesday"):
              place = re.search("Wed:.*?\/", item.contents[0])
              location = place.group(0).replace("/", "").replace("Wed: ", "")      
            elif(dayName == "Thursday"):
              place = re.search("Thurs:.*?\/", item.contents[0])
              location = place.group(0).replace("/", "").replace("Thurs: ", "")
            elif(dayName == "Friday"):
              place = re.search("Fri:.*?\/", item.contents[0])
              location = place.group(0).replace("/", "").replace("Fri: ", "")

        #print place
        #print location
        return location