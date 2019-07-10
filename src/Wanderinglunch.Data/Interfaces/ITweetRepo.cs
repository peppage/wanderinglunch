using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ITweetRepo
    {
        Task<object> CreateAsync(Tweet tweet);
        object Create(Tweet tweet);
        Task<List<Tweet>> GetByIdAsync(string id);
        Task<List<Tweet>> GetRecentAsync(string site, bool notDone = false, int amount = 35);
    }
}
