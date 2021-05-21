using System.Collections.Generic;
using System.Threading.Tasks;
using Dapper;
using Npgsql;
using Wanderinglunch.Core.Interfaces;
using Wanderinglunch.Core.Entities;

namespace Wanderinglunch.Data.Repositories
{
    public class SubRepo : ISubRepo
    {
        private readonly string connString;

        public SubRepo(string connString)
        {
            this.connString = connString;
        }

        public IEnumerable<Sub> All()
        {
            using var conn = new NpgsqlConnection(connString);
            conn.Open();
            return conn.Query<Sub>("SELECT * FROM subs");
        }

        public async Task<IEnumerable<Sub>> AllAsync()
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            return await conn.QueryAsync<Sub>("SELECT * from subs");
        }

        public async Task<int> CreateAsync(Sub sub)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            const string sql = @"INSERT INTO subs
                        (regex, replacement)
                        VALUES
                        (@Regex, @Replacement) returning id;";
            return await conn.QuerySingleAsync<int>(sql, sub);
        }

        public async Task<Sub> GetByIdAsync(int id)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            return await conn.QueryFirstAsync<Sub>("SELECT * FROM subs WHERE id = @id", new { id });
        }

        public async Task<bool> SaveAsync(Sub sub)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            const string sql = @"UPDATE subs SET
                        (regex, replacement) = (@Regex, @Replacement)
                        WHERE id = @Id";
            return await conn.ExecuteAsync(sql, sub) == 1;
        }
    }
}