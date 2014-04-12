import psycopg2
import psycopg2.extras
from datetime import date
import datetime
import time

conn = psycopg2.connect("dbname=foodtruck")
saveCursor = conn.cursor()
epoch = int(time.time())
epochMinus8Hours = int(time.time()) - datetime.timedelta(hours=8).total_seconds()
epochMinus30Days = int(time.time()) - datetime.timedelta(days=30).total_seconds()

upTown = 0
midTown = 0
downTown = 0
brooklyn = 0

with conn.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
    cur.execute("SELECT * FROM trucks;")

    for truck in cur:
        #print truck['id']
        if truck['lastupdate'] > epochMinus8Hours and truck['location'] is not None:
            if truck['region'] == "up":
                upTown += 1
            elif truck['region'] == "mid":
                midTown += 1
            elif truck['region'] == "none":
                downTown += 1
            elif truck['region'] == "bkl":
                brooklyn += 1

            saveCursor.execute(
                """INSERT INTO truckStats (id, time, street, region, location) VALUES 
                (%(id)s, %(time)s, %(street)s, %(region)s, %(location)s );""",
                {'id': truck['id'], 'time' : epoch, 'street': truck['street'],
                 'region': truck['region'], 'location': truck['location']})

    saveCursor.execute(
        """INSERT INTO siteStats (time, upTown, midTown, downTown, brooklyn) VALUES
        (%(time)s, %(upTown)s, %(midTown)s, %(downTown)s, %(brooklyn)s);""",
        {'time': epoch, 'upTown': upTown, 'midTown': midTown, 'downTown': downTown,
         'brooklyn': brooklyn})

    cur.execute("SELECT * FROM siteStats WHERE time > %(time)s;", {'time': epochMinus30Days})

    f = open('public/data/trucks.tsv', 'w')
    f.write("date\tUptown\tMidtown\tDowntown\tBrooklyn\n")
    for stat in cur:
    #    for key, value in stat.iteritems():
            #print key, value
        t = datetime.datetime.fromtimestamp( stat['time'] ).strftime('%Y%m%d')
        f.write(t + "\t" + str(stat['uptown'])+ "\t" + str(stat['midtown']) + "\t" + str(stat['downtown']) + "\t" + str(stat['brooklyn']) + "\n")
    f.close()

conn.commit()
saveCursor.close()
conn.close()
