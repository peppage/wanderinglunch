using Dapper;
using Npgsql;
using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Core.Entities;
using Wanderinglunch.Core.Interfaces;

namespace Wanderinglunch.Data.Repositories
{
    public class LocationRepo : ILocationRepo
    {
        private readonly string connString;

        public LocationRepo(string connString)
        {
            this.connString = connString;
        }

        public IEnumerable<Location> All()
        {
            using var conn = new NpgsqlConnection(connString);
            conn.Open();
            return conn.Query<Location>("SELECT * FROM locations");
        }

        public async Task<IEnumerable<Location>> AllAsync(string site)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            return await conn.QueryAsync<Location>("SELECT * FROM locations WHERE site = @site", new { site });
        }

        public async Task<int> CreateLocationAsync(Location location)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            const string sql = @"INSERT INTO locations
                        (display, matcher, lat, long, zone, site)
                        VALUES
                        (@Display, @Matcher, @Lat, @Long, @Zone, @Site) returning id;";
            return await conn.QuerySingleAsync<int>(sql, location);
        }

        public async Task<Location> GetByIdAsync(int id)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            return await conn.QueryFirstAsync<Location>("SELECT * FROM locations WHERE id = @id", new { id });
        }

        public async Task<bool> SaveLocationAsync(Location location)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            const string sql = @"UPDATE locations SET
                        (display, matcher, lat, long, zone, site) = (@Display, @Matcher, @Lat, @Long, @Zone, @Site)
                        WHERE
                        id = @Id";
            return await conn.ExecuteAsync(sql, location) == 1;
        }
    }
}