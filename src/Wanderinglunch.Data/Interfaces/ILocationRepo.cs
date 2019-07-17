using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ILocationRepo
    {
        List<Location> All();
        Task<List<Location>> AllAsync(string site);
        Task<Location> GetById(int id);
        Task<object> CreateLocationAsync(Location location);
        Task<int> SaveLocationAsync(Location loction);
    }
}
