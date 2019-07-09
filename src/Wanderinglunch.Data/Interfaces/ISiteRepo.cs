using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ISiteRepo
    {
        Task<Site> GetByNameAsync(string name);
    }
}
