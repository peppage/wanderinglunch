using System.Collections.Generic;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Tweetinvi;
using Tweetinvi.Models;
using Tweetinvi.Parameters;

namespace Wanderinglunch.Updator.Services
{
    public class TwitterService : ITwitterService
    {
        private readonly ILogger logger;

        public TwitterService(IConfigurationRoot config, ILogger<App> logger)
        {
            var twitterConfig = config.GetSection("twitter");
            var consumerKey = twitterConfig.GetValue<string>("ConsumerKey");
            var consumerSecret = twitterConfig.GetValue<string>("ConsumerSecret");

            Auth.SetApplicationOnlyCredentials(consumerKey, consumerSecret, true);
        }

        public IEnumerable<ITweet> GetTweets(string id)
        {
            var user = User.GetUserFromScreenName(id);
            return user.GetUserTimeline(new UserTimelineParameters
            {
                IncludeRTS = false,
            });
        }
    }
}
