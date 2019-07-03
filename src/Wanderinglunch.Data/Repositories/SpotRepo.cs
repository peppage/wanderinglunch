using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using PetaPoco;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Data.Queries;
using System.Linq;

namespace Wanderinglunch.Data.Repositories
{
    public class SpotRepo : ISpotRepo
    {
        private readonly IDatabase db;

        public SpotRepo(IDatabase db)
        {
            this.db = db;
        }

        public Task<object> CreateAsync(Spot spot)
        {
            return db.InsertAsync(spot);
        }

        public List<FullSpot> Get(string site, int hours = 8)
        {
            // Well I made a mistake my add this extension to logic and now I can't
            // use it here.
            var time = DateTime.UtcNow.AddHours(hours * -1) - new DateTime(1970, 1, 1);
            return db.Fetch<FullSpot, Truck, Tweet, Location, Image>(SpotQueries.NewSpots, (int)time.TotalSeconds, site);
        }
    }
}
