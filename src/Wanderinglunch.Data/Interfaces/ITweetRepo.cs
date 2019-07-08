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
    }
}
