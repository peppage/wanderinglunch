using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface IUserRepo
    {
        Task<User> GetByEmailAsync(string email);
        Task<object> CreateUserAsync(User user);
    }
}
