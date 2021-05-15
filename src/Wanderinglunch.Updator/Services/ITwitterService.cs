using System.Collections.Generic;
using System.Threading.Tasks;
using Tweetinvi.Models;

namespace Wanderinglunch.Updator.Services
{
    public interface ITwitterService
    {
        Task<IEnumerable<ITweet>> GetTweetsAsync(string id);
    }
}