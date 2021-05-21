using System.Threading.Tasks;
using Dapper;
using Npgsql;
using Wanderinglunch.Core.Interfaces;
using Wanderinglunch.Core.Entities;

namespace Wanderinglunch.Data.Repositories
{
    public class UserRepo : IUserRepo
    {
        private readonly string connString;

        public UserRepo(string connString)
        {
            this.connString = connString;
        }

        public async Task<int> CreateUserAsync(User user)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            const string sql = @"INSERT INTO users
                        (email, password, admin)
                        VALUES
                        (@Email, @Password, @Admin) returning id;";
            return await conn.QuerySingleAsync<int>(sql, user);
        }

        public async Task<User> GetByEmailAsync(string email)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            const string query = "SELECT * FROM users WHERE email = @email";
            return await conn.QueryFirstOrDefaultAsync<User>(query, new { email });
        }
    }
}