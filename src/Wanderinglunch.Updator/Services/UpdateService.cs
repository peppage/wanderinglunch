using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Tweetinvi.Models;
using Wanderinglunch.Data;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Logic;
using Wanderinglunch.Logic.Extensions;
using Location = Wanderinglunch.Data.Models.Location;

namespace Wanderinglunch.Updator.Services
{
    public class UpdateService : IUpdateService
    {
        private readonly ILunchContext lunchContext;
        private readonly ITwitterService twitterService;
        private readonly ILogger logger;
        private readonly List<Sub> substitions;
        private readonly List<Location> locations;

        public UpdateService(ILunchContext lunchContext, ILogger<UpdateService> logger, ITwitterService twitterService)
        {
            this.lunchContext = lunchContext;
            this.twitterService = twitterService;
            this.logger = logger;
            substitions = lunchContext.SubRepo.All();
            locations = lunchContext.LocationRepo.All();
        }

        public async Task Run()
        {
            var trucks = await lunchContext.TruckRepo.AllAsync().ConfigureAwait(false);
            logger.LogDebug($"Total trucks {trucks.Count}");

            foreach (var truck in trucks)
            {
                var tweets = twitterService.GetTweets(truck.TwitName);

                if (tweets != null)
                {
                    SaveTweets(truck, tweets);

                    if (await SearchTweets(truck, tweets))
                    {
                        truck.LastUpdate = DateTimeOffset.UtcNow.ToUnixTimeSeconds();
                        await lunchContext.TruckRepo.UpdateAsync(truck).ConfigureAwait(false);
                    }
                }
            }
        }

        /// <summary>
        /// Save tweets to the database
        /// </summary>
        /// <returns></returns>
        private void SaveTweets(Truck truck, IEnumerable<ITweet> tweets)
        {
            foreach (var tweet in tweets)
            {
                var text = tweet.FullText;
                // These substitutions are for displaying the tweet a website
                text = text.Replace("&amp", "&", StringComparison.InvariantCultureIgnoreCase);
                text = text.Replace("#", "", StringComparison.InvariantCultureIgnoreCase);
                text = text.Replace("\"", "", StringComparison.InvariantCultureIgnoreCase);

                var oldTweet = lunchContext.TweetRepo.GetById(tweet.IdStr);

                if (oldTweet == null)
                {
                    lunchContext.TweetRepo.Create(new Tweet
                    {
                        Text = text,
                        Time = tweet.CreatedAt.GetEpochSeconds(),
                        Id = tweet.IdStr,
                        TruckId = truck.TwitName,
                    });
                }
            }

            logger.LogDebug($"Finished saving {truck.TwitName} tweets");
        }

        /// <summary>
        /// Search the tweets for find and save locations
        /// </summary>
        /// <param name="tweets"></param>
        /// <returns></returns>
        private async Task<bool> SearchTweets(Truck truck, IEnumerable<ITweet> tweets)
        {
            logger.LogDebug($"Searching for locations for {truck.TwitName}");
            var foundLocations = false;

            foreach (var tweet in tweets)
            {
                if (tweet.IsEightHoursOld() && !tweet.ToUser())
                {
                    var text = Substitions.DoSubstitions(substitions, tweet.FullText);
                    if (!HasSkipWords(text))
                    {
                        var locs = Locations.FindLocations(locations, truck.Site, text);
                        if (locs.Count > 0)
                        {
                            logger.LogDebug($"Locations found {truck.TwitName}");
                            foundLocations = true;

                            foreach (var l in locs)
                            {
                                var oldSpot = lunchContext.SpotRepo.GetByTweetAndLocation(tweet.IdStr, l.Id);

                                if (oldSpot == null)
                                {
                                    await lunchContext.SpotRepo.CreateAsync(new Spot
                                    {
                                        TruckId = truck.TwitName,
                                        LocationId = l.Id,
                                        TweetId = tweet.IdStr
                                    }).ConfigureAwait(false);
                                }
                            }
                        }
                    }
                }
            }

            return foundLocations;
        }

        private static bool HasSkipWords(string text) => text.Contains("tomorrow") || text.Contains("schedule") || text.Contains("cancelled");
    }
}
