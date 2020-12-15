using Dapper;
using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Data.Queries;
using Wanderinglunch.Data.Schema;

namespace Wanderinglunch.Data.Repositories
{
    public class SpotRepo : ISpotRepo
    {
        private readonly IDbConnection db;

        public SpotRepo(IDbConnection db)
        {
            this.db = db;
        }

        public Task<int> CreateAsync(Spot spot) => db.InsertAsync(spot);

        public IEnumerable<FullSpot> Get(string site, int hours = 8)
        {
            // Well I made a mistake my add this extension to logic and now I can't
            // use it here.
            var time = DateTime.UtcNow.AddHours(hours * -1) - new DateTime(1970, 1, 1);

            return db.Query<Truck, Location, Tweet, Image, FullSpot>(SpotQueries.NewSpots, (truck, location, tweet, image) =>
            { return new FullSpot { Truck = truck, Location = location, Tweet = tweet, Image = image }; },
            param: new { time = (int)time.TotalSeconds, site });
        }

        public Spot GetByTweetAndLocation(string tweetId, long locationId)
        {
            var sql = $@"SELECT * FROM {SpotSchema.Table} WHERE {SpotSchema.Columns.TweetId} = @tweetId AND {SpotSchema.Columns.LocationId} = @locationId";
            return db.Query<Spot>(sql, new { tweetId, locationId }).SingleOrDefault();
        }
    }
}