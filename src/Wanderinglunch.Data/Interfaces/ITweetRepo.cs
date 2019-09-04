using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ITweetRepo
    {
        Task SaveAsync(Tweet tweet);
        void Create(Tweet tweet);
        Task<Tweet> GetByIdAsync(string id);
        Task<List<Tweet>> GetByTruckIdAsync(string id);
        Task<List<Tweet>> GetRecentAsync(string site, bool notDone = false, int amount = 35);
    }
}
