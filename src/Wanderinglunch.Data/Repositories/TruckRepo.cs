using System.Collections.Generic;
using System.Threading.Tasks;
using PetaPoco;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Repositories
{
    public class TruckRepo : ITruckRepo
    {
        private readonly IDatabase db;

        public TruckRepo(IDatabase db)
        {
            this.db = db;
        }

        public Task<List<Truck>> All(bool archived = false)
        {
            return db.FetchAsync<Truck>("WHERE archived = @0", archived);
        }
    }
}
