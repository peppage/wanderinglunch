using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface IImageRepo
    {
        Task<IEnumerable<Image>> ByTruckIdAsync(string truckId);

        Task<IEnumerable<Image>> GetMenusAsync();
    }
}