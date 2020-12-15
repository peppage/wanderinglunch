using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using Dapper;
using Dapper.Contrib.Extensions;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Data.Schema;

namespace Wanderinglunch.Data.Repositories
{
    public class LocationRepo : ILocationRepo
    {
        private readonly IDbConnection db;

        public LocationRepo(IDbConnection db)
        {
            this.db = db;
        }

        public IEnumerable<Location> All() => db.GetAll<Location>();

        public Task<IEnumerable<Location>> AllAsync(string site)
        {
            var sql = $@"SELECT * FROM {LocationSchema.Table} WHERE {LocationSchema.Columns.Site} = @site";
            return db.QueryAsync<Location>(sql, new { site });
        }

        public Task<int> CreateLocationAsync(Location location) => db.InsertAsync(location);

        public Task<Location> GetByIdAsync(int id) => db.GetAsync<Location>(id);

        public Task<bool> SaveLocationAsync(Location location) => db.UpdateAsync(location);
    }
}