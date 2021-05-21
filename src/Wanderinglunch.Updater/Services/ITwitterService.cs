using System.Collections.Generic;
using System.Threading.Tasks;
using Tweetinvi.Models;

namespace Wanderinglunch.Updater.Services
{
    public interface ITwitterService
    {
        Task<IEnumerable<ITweet>> GetTweetsAsync(string id);
    }
}