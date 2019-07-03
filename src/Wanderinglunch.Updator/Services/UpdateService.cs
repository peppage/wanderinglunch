using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Tweetinvi.Models;
using Wanderinglunch.Data;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Updator.Extensions;
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

        public UpdateService(ILunchContext lunchContext, ILogger<App> logger, ITwitterService twitterService)
        {
            this.lunchContext = lunchContext;
            this.twitterService = twitterService;
            this.logger = logger;
            this.substitions = lunchContext.SubRepo.All();
            this.locations = lunchContext.LocationRepo.All();
        }

        public async Task Run()
        {
            var trucks = await lunchContext.TruckRepo.AllAsync();
            logger.LogDebug($"Total trucks {trucks.Count}");
            foreach (var truck in trucks)
            {
                var tweets = twitterService.GetTweets(truck.TwitName);

                SaveTweets(truck, tweets);

                if (await SearchTweets(truck, tweets))
                {
                    truck.LastUpdate = DateTimeOffset.UtcNow.ToUnixTimeSeconds();
                    await lunchContext.TruckRepo.UpdateAsync(truck);
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
                // Ignore failed inserts they're duplicates
                try
                {
                    var text = tweet.FullText;
                    // These substitutions are for displaying the tweet a website
                    text = text.Replace("&amp", "&", StringComparison.InvariantCultureIgnoreCase);
                    text = text.Replace("#", "", StringComparison.InvariantCultureIgnoreCase);
                    text = text.Replace("\"", "", StringComparison.InvariantCultureIgnoreCase);

                    lunchContext.TweetRepo.Create(new Tweet
                    {
                        Text = text,
                        Time = tweet.CreatedAt.GetEpochSeconds(),
                        Id = tweet.IdStr,
                        TruckId = truck.TwitName,
                    });
                }
                catch
                {
                }
            }

            logger.LogDebug($"Finished saving {truck.TwitName} tweets");
        }

        /// <summary>
        /// Find all locations in a tweet. This is after substitutions.
        /// </summary>
        /// <param name="site">The site where the truck is.</param>
        /// <param name="text">The tweet text to search</param>
        /// <returns>A list of found locations</returns>
        private List<Location> FindLocations(string site, string text)
        {
            var found = new List<Location>();

            foreach (var location in locations.Where(l => l.Site == site))
            {
                var regex = new Regex(location.Matcher);
                var match = regex.Match(text);
                if (match.Success)
                {
                    found.Add(location);
                }
            }

            return found;
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
                    var text = MakeSubstitutions(tweet.FullText);
                    if (!HasSkipWords(text))
                    {
                        var locations = FindLocations(truck.Site, text);
                        if (locations.Any())
                        {
                            logger.LogDebug($"Locations found {truck.TwitName}");
                            await Task.WhenAll(locations.Select(l =>
                            {
                                return lunchContext.SpotRepo.CreateAsync(new Spot
                                {
                                    TruckId = truck.TwitName,
                                    LocationId = l.Id,
                                    TweetId = tweet.IdStr
                                });
                            }));

                        }
                    }
                }
            }

            return foundLocations;
        }

        private bool HasSkipWords(string text) => text.Contains("tomorrow") || text.Contains("schedule") || text.Contains("cancelled");

        private string MakeSubstitutions(string text)
        {
            foreach (var sub in substitions)
            {
                var regex = new Regex(sub.Regex);
                text = regex.Replace(text, sub.Replacement);
            }

            return text;
        }
    }
}
