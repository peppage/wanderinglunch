using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Core.Entities;

namespace Wanderinglunch.Core.Interfaces
{
    public interface ITruckRepo
    {
        IEnumerable<Truck> All(bool archived = false);

        Task<IEnumerable<Truck>> AllAsync(string site, bool onlyUnarchived = false);

        bool Update(Truck truck);

        Task<Truck> GetByIdAsync(string id);

        Task<bool> CreateAsync(Truck truck);
    }
}