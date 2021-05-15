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

        Tweet GetById(string id);

        Task<IEnumerable<Tweet>> GetByTruckIdAsync(string id);

        Task<IEnumerable<Tweet>> GetRecentAsync(string site, bool notDone = false, int amount = 35);
    }
}