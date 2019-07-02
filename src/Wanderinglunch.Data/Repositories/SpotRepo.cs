using System.Collections.Generic;
using System.Threading.Tasks;
using PetaPoco;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;

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
    }
}
