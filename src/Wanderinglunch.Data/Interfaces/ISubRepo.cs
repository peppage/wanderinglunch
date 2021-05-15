using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ISubRepo
    {
        IEnumerable<Sub> All();

        Task<IEnumerable<Sub>> AllAsync();

        Task<Sub> GetByIdAsync(int id);

        Task<int> CreateAsync(Sub sub);

        Task<bool> SaveAsync(Sub sub);
    }
}