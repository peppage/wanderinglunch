using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;
using Dapper.Contrib.Extensions;

namespace Wanderinglunch.Data.Repositories
{
    public class SiteRepo : ISiteRepo
    {
        private readonly IDbConnection db;

        public SiteRepo(IDbConnection db)
        {
            this.db = db;
        }

        public Task<IEnumerable<Site>> GetAllAsync() => db.GetAllAsync<Site>();

        public Site GetByName(string name) => db.Get<Site>(name);

        public Task<Site> GetByNameAsync(string name) => db.GetAsync<Site>(name);
    }
}