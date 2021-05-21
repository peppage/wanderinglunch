using System.Threading.Tasks;
using Wanderinglunch.Core.Entities;

namespace Wanderinglunch.Core.Interfaces
{
    public interface IUserRepo
    {
        Task<User> GetByEmailAsync(string email);

        Task<int> CreateUserAsync(User user);
    }
}