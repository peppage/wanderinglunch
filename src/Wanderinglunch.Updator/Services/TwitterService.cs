using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using Tweetinvi;
using Tweetinvi.Exceptions;
using Tweetinvi.Models;
using Tweetinvi.Parameters;

namespace Wanderinglunch.Updator.Services
{
    public class TwitterService : ITwitterService
    {
        private readonly ILogger logger;

        public TwitterService(IConfigurationRoot config, ILogger<TwitterService> logger)
        {
            var twitterConfig = config.GetSection("twitter");
            var consumerKey = twitterConfig.GetValue<string>("ConsumerKey");
            var consumerSecret = twitterConfig.GetValue<string>("ConsumerSecret");
            ExceptionHandler.SwallowWebExceptions = false;

            this.logger = logger;

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
                logger.LogError(ex, "Argument", new
                {
                    TruckId = id,
                });
            }
            catch (TwitterTimeoutException)
            {
                //This one happens and we should ignore.
            }
            catch (TwitterException ex)
            {
                if (ShouldSendErrorNotification(ex))
                {
                    logger.LogError(ex, "Twitter", new
                    {
                        TruckId = id,
                        StatusCode = ex.StatusCode,
                        Twitter = ex.TwitterExceptionInfos.First().Message,
                    });
                }
            }

            return new List<ITweet>();
        }

        private bool ShouldSendErrorNotification(TwitterException ex) => ex.StatusCode != 503;
    }
}