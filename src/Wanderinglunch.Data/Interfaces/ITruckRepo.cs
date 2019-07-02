using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ITruckRepo
    {
        Task<List<Truck>> AllAsync(bool archived = false);
        Task<int> UpdateAsync(Truck truck);
    }
}
