using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ISpotRepo
    {
        Task<object> CreateAsync(Spot spot);
    }
}