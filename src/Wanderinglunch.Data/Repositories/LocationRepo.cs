using System.Collections.Generic;
using System.Threading.Tasks;
using PetaPoco;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Repositories
{
    public class LocationRepo : ILocationRepo
    {
        private readonly IDatabase db;

        public LocationRepo(IDatabase db)
        {
            this.db = db;
        }

        public List<Location> All() => db.Fetch<Location>();

        public Task<List<Location>> AllAsync(string site) => db.FetchAsync<Location>("WHERE site = @0", site);

        public Task<object> CreateLocationAsync(Location location) => db.InsertAsync(location);

        public Task<Location> GetByIdAsync(int id) => db.SingleOrDefaultAsync<Location>("WHERE id = @0", id);

        public Task<int> SaveLocationAsync(Location location) => db.UpdateAsync(location);
    }
}
