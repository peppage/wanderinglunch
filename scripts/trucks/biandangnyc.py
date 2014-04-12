# Bian Dang food truck schedule grab
# python 2.7

from urllib import urlopen
from bs4 import BeautifulSoup
import datetime
import time

class biandangnyc:

    def job(self):

        urlObject = urlopen("http://tyang.1.ai/schedule.html")

        soup = BeautifulSoup(urlObject.read(), "lxml")

        dds = soup.find_all('dd')

        now = datetime.datetime.now()

        dayName = now.strftime('%A')

        hood = 0 #The hood from which day it is in
        address = 0 #The address

        if(dayName == "Monday"):
            hood = 0
            address = 1
        elif(dayName == "Tuesday"):
            hood = 2
            address = 3
        elif(dayName == "Wednesday"):
            hood = 4
            address =5
        elif(dayName == "Thursday"):
            hood = 6
            address = 7
        elif(dayName == "Friday"):
            hood = 8
            address = 9

        biangHood = dds[hood].string.strip()
        bianAddress= dds[address].string.strip()

        if address == 5:
             #Fix spelling issue on their site
            bianAddress = bianAddress.replace("Washingtong", "Washington")

        #print biangHood
        #print bianAddress

        return bianAddress