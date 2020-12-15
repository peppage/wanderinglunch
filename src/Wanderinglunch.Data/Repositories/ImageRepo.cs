using System.Collections.Generic;
using System.Threading.Tasks;
using PetaPoco;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Repositories
{
    public class ImageRepo : IImageRepo
    {
        private readonly IDatabase db;

        public ImageRepo(IDatabase db)
        {
            this.db = db;
        }

        public Task<List<Image>> ByTruckIdAsync(string truckId) => db.FetchAsync<Image>("WHERE truck_id = @0", truckId);

        public Task<List<Image>> GetMenusAsync() => db.FetchAsync<Image>("WHERE menu = @0", true);
    }
}
