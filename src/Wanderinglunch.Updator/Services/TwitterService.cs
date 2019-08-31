using System;
using System.Collections.Generic;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Rollbar;
using Tweetinvi;
using Tweetinvi.Models;
using Tweetinvi.Parameters;

namespace Wanderinglunch.Updator.Services
{
    public class TwitterService : ITwitterService
    {
        public TwitterService(IConfigurationRoot config)
        {
            var twitterConfig = config.GetSection("twitter");
            var consumerKey = twitterConfig.GetValue<string>("ConsumerKey");
            var consumerSecret = twitterConfig.GetValue<string>("ConsumerSecret");

            Auth.SetApplicationOnlyCredentials(consumerKey, consumerSecret, true);
        }

        public IEnumerable<ITweet> GetTweets(string id)
        {
            try
            {
                var user = User.GetUserFromScreenName(id);
                if (user == null)
                {
                    throw new KeyNotFoundException("404 twitter handle");
                }

                return user.GetUserTimeline(new UserTimelineParameters
                {
                    IncludeRTS = false,
                });
            }
            catch (Exception e)
            {
                RollbarLocator.RollbarInstance.Error(e, new Dictionary<string, object>{
                    {"truck id", id},
                });
                return new List<ITweet>();
            }
        }
    }
}
