using System.Collections.Generic;
using System.Threading.Tasks;
using Dapper;
using Npgsql;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Repositories
{
    public class TruckRepo : ITruckRepo
    {
        private readonly string connString;

        public TruckRepo(string connString)
        {
            this.connString = connString;
        }

        public IEnumerable<Truck> All(bool archived = false)
        {
            using var conn = new NpgsqlConnection(connString);
            conn.Open();
            return conn.Query<Truck>("SELECT * FROM trucks WHERE archive = @archived", new { archived });
        }

        public async Task<IEnumerable<Truck>> AllAsync(string site, bool onlyUnarchived = true)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();

            var sql = "SELECT * FROM trucks WHERE site = @site";

            var dynamicParams = new DynamicParameters();
            dynamicParams.Add("site", site);

            if (!onlyUnarchived)
            {
                sql += "AND archived = @archived";
                dynamicParams.Add("archive", false);
            }

            return await conn.QueryAsync<Truck>(sql, dynamicParams);
        }

        public async Task<bool> CreateAsync(Truck truck)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            const string sql = @"INSERT INTO trucks
                        (name, id, web_url, last_update, type, about, foursquare, site, archive)
                        VALUES
                        (@Name, @Id, @WebURL, @LastUpdate, @Type, @About, @Foursquare, @Site, @Archive)";
            return await conn.ExecuteAsync(sql, truck) == 1;
        }

        public async Task<Truck> GetByIdAsync(string id)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            const string query = "SELECT * FROM trucks WHERE id = @id";
            return await conn.QueryFirstOrDefaultAsync<Truck>(query, new { id });
        }

        public bool Update(Truck truck)
        {
            using var conn = new NpgsqlConnection(connString);
            conn.Open();
            const string sql = @"UPDATE trucks SET
                        (name, web_url, last_update, type, about, foursquare, site, archive) = (@Name, @WebURL, @LastUpdate, @Type, @About, @Foursquare, @Site, @Archive)
                        WHERE
                        id = @Id";
            return conn.Execute(sql, truck) == 1;
        }
    }
}