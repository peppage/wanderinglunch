using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ITruckRepo
    {
        Task<List<Truck>> AllAsync(bool archived = false);
        Task<List<Truck>> AllAsync(string site, bool onlyUnarchived = false);
        Task<int> UpdateAsync(Truck truck);
        Task<Truck> GetByIdAsync(string id);
        Task<object> CreateAsync(Truck truck);
    }
}
