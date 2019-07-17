using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ILocationRepo
    {
        List<Location> All();
        Task<List<Location>> AllAsync(string site);
    }
}
