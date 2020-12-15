using System.Threading.Tasks;
using PetaPoco;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Repositories
{
    public class UserRepo : IUserRepo
    {
        private readonly IDatabase db;

        public UserRepo(IDatabase db)
        {
            this.db = db;
        }

        public Task<object> CreateUserAsync(User user) => db.InsertAsync(user);

        public Task<User> GetByEmailAsync(string email) => db.SingleOrDefaultAsync<User>("WHERE email = @0", email);
    }
}
