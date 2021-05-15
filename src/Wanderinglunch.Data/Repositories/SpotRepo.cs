using Dapper;
using Npgsql;
using System;
using System.Collections.Generic;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Data.Queries;

namespace Wanderinglunch.Data.Repositories
{
    public class SpotRepo : ISpotRepo
    {
        private readonly string connString;

        public SpotRepo(string connString)
        {
            this.connString = connString;
        }

        public object Create(Spot spot)
        {
            using var conn = new NpgsqlConnection(connString);
            conn.Open();
            const string sql = @"INSERT INTO trucks
                        (truck_id, location_id, tweet_id)
                        VALUES
                        (@TruckId, @LocationId, @TweetId)";
            return conn.Execute(sql, spot);
        }

        public IEnumerable<FullSpot> Get(string site, int hours = 8)
        {
            // Well I made a mistake my add this extension to logic and now I can't
            // use it here.
            var time = DateTime.UtcNow.AddHours(hours * -1) - new DateTime(1970, 1, 1);
            using var conn = new NpgsqlConnection(connString);
            conn.Open();

            return conn.Query<Truck, Location, Tweet, Image, FullSpot>(SpotQueries.NewSpots, (truck, location, tweet, image) => new FullSpot { Truck = truck, Location = location, Tweet = tweet, Image = image },
            param: new { time = (int)time.TotalSeconds, site });
        }

        public Spot GetByTweetAndLocation(string tweetId, long locationId)
        {
            using var conn = new NpgsqlConnection(connString);
            conn.Open();

            const string sql = "SELECT * FROM spots WHERE tweet_id = @tweetId AND location_id = @locationId";
            return conn.QueryFirst<Spot>(sql, new { tweetId, locationId });
        }
    }
}