using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Tweetinvi;
using Tweetinvi.Exceptions;
using Tweetinvi.Models;
using Tweetinvi.Parameters;

namespace Wanderinglunch.Updater.Services
{
    public class TwitterService : ITwitterService
    {
        private readonly ILogger logger;
        private TwitterClient twitterClient;
        private readonly ConsumerOnlyCredentials consumerOnlyCredentials;

        public TwitterService(IConfigurationRoot config, ILogger<TwitterService> logger)
        {
            var twitterConfig = config.GetSection("twitter");
            var consumerKey = twitterConfig.GetValue<string>("ConsumerKey");
            var consumerSecret = twitterConfig.GetValue<string>("ConsumerSecret");

            this.logger = logger;

            consumerOnlyCredentials = new ConsumerOnlyCredentials(consumerKey, consumerSecret);
        }

        private async Task SetupTwitterClientAsync()
        {
            if (twitterClient == null)
            {
                var tempClient = new TwitterClient(consumerOnlyCredentials);
                var bearerToken = await tempClient.Auth.CreateBearerTokenAsync();

                var appCredentials = new ConsumerOnlyCredentials(consumerOnlyCredentials.ConsumerKey, consumerOnlyCredentials.ConsumerSecret)
                {
                    BearerToken = bearerToken
                };

                twitterClient = new TwitterClient(appCredentials);
                logger.LogDebug("Setting up twitter client");
            }
        }

        public async Task<IEnumerable<ITweet>> GetTweetsAsync(string id)
        {
            try
            {
                await SetupTwitterClientAsync();

                var parameters = new GetUserTimelineParameters(id)
                {
                    IncludeRetweets = false,
                    ExcludeReplies = true
                };

                return await twitterClient.Timelines.GetUserTimelineAsync(parameters);
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
                    logger.LogError(ex, $"{ex.TwitterExceptionInfos.FirstOrDefault()?.Message} - {id}", new
                    {
                        TruckId = id,
                        StatusCode = ex.StatusCode,
                        Twitter = ex.TwitterExceptionInfos.FirstOrDefault()?.Message,
                    });
                }
            }

            return new List<ITweet>();
        }

        private static bool ShouldSendErrorNotification(TwitterException ex) => ex.StatusCode != 503;
    }
}