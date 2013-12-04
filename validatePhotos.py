import psycopg2
import psycopg2.extras
import foursquare

CLIENT_ID = 'P1JDYDE13QQDC11VUSA4LV3VV25OTRPHV1WAV5WP3VCE0QUP'
CLIENT_SECRET = 'AZFYOJILNUPP5INAMYWIRCKIHRWPHZQBZD0MWFLRFRLDYWEE'

conn = psycopg2.connect("dbname=foodtruck")
saveCursor = conn.cursor()
client = foursquare.Foursquare(client_id=CLIENT_ID, client_secret=CLIENT_SECRET)

with conn.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
    cur.execute("SELECT * FROM trucks WHERE id='mrnice';")

    for truck in cur:
        print truck['id']
        data = client.venues.photos(truck['foursquare'], params={})
        photoItems = data['photos']['items']

        with conn.cursor(cursor_factory=psycopg2.extras.DictCursor) as imageCur:
            imageCur.execute("SELECT * FROM images WHERE twitname='" + truck['twitname']+ "';")
            for image in imageCur:
                found = False
                for photo in photoItems:
                    if image['id'] == photo['id']:
                        found = True
                        break
                print image['id'] + " " + str(found)
                if not found:
                    # Need to see if maybe it's in the next 200
                     saveCursor.execute(
                        """UPDATE images SET visibility = (%(visibility)s) WHERE id = (%(id)s);""",
                        {'visibility': 'private', 'id': image['id']})

conn.commit()
saveCursor.close()
conn.close()