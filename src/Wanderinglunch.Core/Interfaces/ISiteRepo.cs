using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Core.Entities;

namespace Wanderinglunch.Core.Interfaces
{
    public interface ISiteRepo
    {
        Task<Site> GetByNameAsync(string name);

        Site GetByName(string name);

        Task<IEnumerable<Site>> GetAllAsync();
    }
}