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

        public List<Location> All()
        {
            return db.Fetch<Location>();
        }
    }
}
