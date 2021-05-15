using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ILocationRepo
    {
        IEnumerable<Location> All();

        Task<IEnumerable<Location>> AllAsync(string site);

        Task<Location> GetByIdAsync(int id);

        Task<int> CreateLocationAsync(Location location);

        Task<bool> SaveLocationAsync(Location loction);
    }
}