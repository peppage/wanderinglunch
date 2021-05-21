using Dapper;
using Npgsql;
using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Core.Entities;
using Wanderinglunch.Core.Interfaces;

namespace Wanderinglunch.Data.Repositories
{
    public class ImageRepo : IImageRepo
    {
        private readonly string connString;

        public ImageRepo(string connString)
        {
            this.connString = connString;
        }

        public async Task<IEnumerable<Image>> ByTruckIdAsync(string truckId)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            const string sql = "SELECT * FROM images WHERE truck_id = @truckId";
            return await conn.QueryAsync<Image>(sql, new { truckId });
        }

        public async Task<IEnumerable<Image>> GetMenusAsync()
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            const string sql = "SELECT * FROM images WHERE menu='t'";
            return await conn.QueryAsync<Image>(sql);
        }
    }
}