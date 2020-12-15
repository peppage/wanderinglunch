using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Dapper.Contrib.Extensions;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Data.Schema;

namespace Wanderinglunch.Data.Repositories
{
    public class UserRepo : IUserRepo
    {
        private readonly IDbConnection db;

        public UserRepo(IDbConnection db)
        {
            this.db = db;
        }

        public Task<int> CreateUserAsync(User user) => db.InsertAsync<User>(user);

        public User GetByEmail(string email)
        {
            var sql = $@"SELECT * FROM {UserSchema.Table} WHERE {UserSchema.Columns.Email} = @email";
            return db.Query<User>(sql, new { email }).FirstOrDefault();
        }
    }
}