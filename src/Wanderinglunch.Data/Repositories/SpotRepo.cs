using PetaPoco;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Data.Queries;

namespace Wanderinglunch.Data.Repositories
{
    public class SpotRepo : ISpotRepo
    {
        private readonly IDatabase db;

        public SpotRepo(IDatabase db)
        {
            this.db = db;
        }

        public object Create(Spot spot) => db.Insert(spot);

        public List<FullSpot> Get(string site, int hours = 8)
        {
            // Well I made a mistake my add this extension to logic and now I can't
            // use it here.
            var time = DateTime.UtcNow.AddHours(hours * -1) - new DateTime(1970, 1, 1);
            return db.Fetch<FullSpot, Truck, Location, Tweet, Image>(SpotQueries.NewSpots, (int)time.TotalSeconds, site);
        }

        public Spot GetByTweetAndLocation(string tweetId, long locationId) => db.SingleOrDefault<Spot>("WHERE tweet_id = @0 and location_id = @1", tweetId, locationId);
    }
}