using System.Collections.Generic;
using Tweetinvi.Models;

namespace Wanderinglunch.Updator.Services
{
    public interface ITwitterService
    {
        IEnumerable<ITweet> GetTweets(string id);
    }
}
