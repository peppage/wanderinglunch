using System.Collections.Generic;
using System.Threading.Tasks;
using PetaPoco;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Repositories
{
    public class SiteRepo : ISiteRepo
    {
        private readonly IDatabase db;

        public SiteRepo(IDatabase db)
        {
            this.db = db;
        }

        public Task<Site> GetByNameAsync(string name) => db.SingleOrDefaultAsync<Site>("WHERE name = @0", name);
    }
}
