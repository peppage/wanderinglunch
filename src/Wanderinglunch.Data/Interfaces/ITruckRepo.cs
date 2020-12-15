using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ITruckRepo
    {
        List<Truck> All(bool archived = false);

        Task<List<Truck>> AllAsync(string site, bool onlyUnarchived = false);

        int Update(Truck truck);

        Task<Truck> GetByIdAsync(string id);

        Task<object> CreateAsync(Truck truck);
    }
}