using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface IUserRepo
    {
        User GetByEmail(string email);

        Task<int> CreateUserAsync(User user);
    }
}