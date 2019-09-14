using System;
using System.Collections.Generic;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Rollbar;
using Tweetinvi;
using Tweetinvi.Exceptions;
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
            ExceptionHandler.SwallowWebExceptions = false;

            Auth.SetApplicationOnlyCredentials(consumerKey, consumerSecret, true);
        }

        public IEnumerable<ITweet> GetTweets(string id)
        {
            try
            {
                var user = User.GetUserFromScreenName(id);
                return user.GetUserTimeline(new UserTimelineParameters
                {
                    IncludeRTS = false,
                });
            }
            catch (ArgumentException ex)
            {
                RollbarLocator.RollbarInstance.Error(ex, new Dictionary<string, object>{
                    {"truck id", id},
                });
            }
            catch (TwitterException ex)
            {
                RollbarLocator.RollbarInstance.Error(ex, new Dictionary<string, object>{
                    {"truck id", id},
                    {"status code", ex.StatusCode},
                    {"twitter", ex.TwitterExceptionInfos.ToString()},
                });
            }

            return new List<ITweet>();
        }
    }
}
