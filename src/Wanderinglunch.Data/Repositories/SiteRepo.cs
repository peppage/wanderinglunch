using System.Collections.Generic;
using System.Threading.Tasks;
using Dapper;
using Npgsql;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Repositories
{
    public class SiteRepo : ISiteRepo
    {
        private readonly string connString;

        public SiteRepo(string connString)
        {
            this.connString = connString;
        }

        public async Task<IEnumerable<Site>> GetAllAsync()
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            return await conn.QueryAsync<Site>("SELECT * FROM sites");
        }

        public Site GetByName(string name)
        {
            using var conn = new NpgsqlConnection(connString);
            conn.Open();
            return conn.QueryFirst<Site>("SELECT * FROM sites WHERE name = @name", new { name });
        }

        public async Task<Site> GetByNameAsync(string name)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            return await conn.QueryFirstAsync<Site>("SELECT * FROM sites WHERE name = @name", new { name });
        }
    }
}