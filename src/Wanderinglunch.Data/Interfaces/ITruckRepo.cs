using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ITruckRepo
    {
        Task<IEnumerable<Truck>> AllAsync(bool archived = false);

        Task<IEnumerable<Truck>> AllAsync(string site, bool onlyUnarchived = false);

        Task<bool> UpdateAsync(Truck truck);

        Task<Truck> GetByIdAsync(string id);

        Task<int> CreateAsync(Truck truck);
    }
}