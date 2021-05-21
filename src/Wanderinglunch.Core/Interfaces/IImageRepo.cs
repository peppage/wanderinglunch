using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Core.Entities;

namespace Wanderinglunch.Core.Interfaces
{
    public interface IImageRepo
    {
        Task<IEnumerable<Image>> ByTruckIdAsync(string truckId);

        Task<IEnumerable<Image>> GetMenusAsync();
    }
}