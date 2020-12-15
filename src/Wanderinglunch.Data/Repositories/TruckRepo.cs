using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper.Contrib.Extensions;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;
using Dapper;
using Wanderinglunch.Data.Schema;

namespace Wanderinglunch.Data.Repositories
{
    public class TruckRepo : ITruckRepo
    {
        private readonly IDbConnection db;

        public TruckRepo(IDbConnection db)
        {
            this.db = db;
        }

        public Task<IEnumerable<Truck>> AllAsync(bool archived = false)
        {
            var sql = $@"SELECT * FROM {TruckSchema.Table} WHERE {TruckSchema.Columns.Archive} = @archive";
            return db.QueryAsync<Truck>(sql, new { archive = archived });
        }

        public Task<IEnumerable<Truck>> AllAsync(string site, bool onlyUnarchived = true)
        {
            var dynamicParams = new DynamicParameters();

            var sql = $@"SELECT * FROM {TruckSchema.Table} WHERE {TruckSchema.Columns.Site} = @site";
            dynamicParams.Add("site", site);

            if (!onlyUnarchived)
            {
                sql += $@"AND {TruckSchema.Columns.Archive} = @archive";
                dynamicParams.Add("archive", false);
            }

            return db.QueryAsync<Truck>(sql, dynamicParams);
        }

        public Task<int> CreateAsync(Truck truck) => db.InsertAsync(truck);

        public Task<Truck> GetByIdAsync(string id) => db.GetAsync<Truck>(id);

        public Task<bool> UpdateAsync(Truck truck) => db.UpdateAsync(truck);
    }
}