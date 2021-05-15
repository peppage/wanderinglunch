using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
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
        private readonly IEnumerable<Sub> substitions;
        private readonly IEnumerable<Location> locations;

        public UpdateService(ILunchContext lunchContext, ILogger<UpdateService> logger, ITwitterService twitterService)
        {
            this.lunchContext = lunchContext;
            this.twitterService = twitterService;
            this.logger = logger;
            substitions = lunchContext.SubRepo.All();
            locations = lunchContext.LocationRepo.All();
        }

        public async Task RunAsync()
        {
            var trucks = lunchContext.TruckRepo.All();
            logger.LogDebug($"Total trucks {trucks.Count()}");

            foreach (var truck in trucks)
            {
                var tweets = await twitterService.GetTweetsAsync(truck.Id);

                if (tweets != null)
                {
                    SaveTweets(truck, tweets);

                    if (SearchTweets(truck, tweets))
                    {
                        truck.LastUpdate = DateTimeOffset.UtcNow.ToUnixTimeSeconds();
                        lunchContext.TruckRepo.Update(truck);
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
                        Time = tweet.CreatedAt.ToUnixTimeSeconds(),
                        Id = tweet.IdStr,
                        TruckId = truck.Id,
                    });
                }
            }

            logger.LogDebug($"Finished saving {truck.Id} tweets");
        }

        /// <summary>
        /// Search the tweets for find and save locations
        /// </summary>
        /// <param name="tweets"></param>
        /// <returns></returns>
        private bool SearchTweets(Truck truck, IEnumerable<ITweet> tweets)
        {
            logger.LogDebug($"Searching for locations for {truck.Id}");
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
                            logger.LogDebug($"Locations found {truck.Id}");
                            foundLocations = true;

                            foreach (var l in locs)
                            {
                                var oldSpot = lunchContext.SpotRepo.GetByTweetAndLocation(tweet.IdStr, l.Id);

                                if (oldSpot == null)
                                {
                                    lunchContext.SpotRepo.Create(new Spot
                                    {
                                        TruckId = truck.Id,
                                        LocationId = l.Id,
                                        TweetId = tweet.IdStr
                                    });
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