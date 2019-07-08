using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PetaPoco;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Data.Queries;

namespace Wanderinglunch.Data.Repositories
{
    public class TruckRepo : ITruckRepo
    {
        private readonly IDatabase db;

        public TruckRepo(IDatabase db)
        {
            this.db = db;
        }

        public Task<List<Truck>> AllAsync(bool archived = false)
        {
            return db.FetchAsync<Truck>("WHERE archive = @0", archived);
        }

        public Task<List<Truck>> AllAsync(string site, bool archived = false)
        {
            return db.FetchAsync<Truck>("WHERE archive = @0 and site = @1", archived, site);
        }

        public Task<Truck> GetByIdAsync(string id) => db.SingleOrDefaultAsync<Truck>("WHERE twit_name = @0", id);

        public Task<int> UpdateAsync(Truck truck) => db.UpdateAsync(truck);
    }
}
