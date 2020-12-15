using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using Dapper;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Data.Schema;

namespace Wanderinglunch.Data.Repositories
{
    public class ImageRepo : IImageRepo
    {
        private readonly IDbConnection db;

        public ImageRepo(IDbConnection db)
        {
            this.db = db;
        }

        public Task<IEnumerable<Image>> ByTruckIdAsync(string truckId)
        {
            var sql = $@"SELECT * FROM {ImageSchema.Table} WHERE {ImageSchema.Columns.TruckId} = @truckId";
            return db.QueryAsync<Image>(sql, new { truckId });
        }

        public Task<IEnumerable<Image>> GetMenusAsync()
        {
            var sql = $@"SELECT * FROM {ImageSchema.Table} WHERE {ImageSchema.Columns.Menu} = @menu";
            return db.QueryAsync<Image>(sql, new { menu = true });
        }
    }
}