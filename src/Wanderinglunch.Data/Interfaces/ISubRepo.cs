using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ISubRepo
    {
        List<Sub> All();
        Task<List<Sub>> AllAsync();
        Task<Sub> GetByIdAsync(int id);
        Task<object> CreateAsync(Sub sub);
        Task<int> SaveAsync(Sub sub);
    }
}
