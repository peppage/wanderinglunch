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

                var saveTweetsTask = SaveTweets(truck.TwitName, tweets);

                if (await SearchTweets(tweets))
                {
                    truck.LastUpdate = DateTimeOffset.UtcNow.ToUnixTimeSeconds();
                    await lunchContext.TruckRepo.UpdateAsync(truck);
                }

                await saveTweetsTask;
            }
        }

        /// <summary>
        /// Save tweets to the database
        /// </summary>
        /// <returns></returns>
        private Task SaveTweets(string id, IEnumerable<ITweet> tweets)
        {
            return Task.WhenAll(tweets.Select(tweet =>
            {
                // Ignore failed inserts they're duplicates
                try
                {
                    var text = tweet.FullText;
                    // These substitutions are for displaying the tweet a website
                    text = text.Replace("&amp", "&", StringComparison.InvariantCultureIgnoreCase);
                    text = text.Replace("#", "", StringComparison.InvariantCultureIgnoreCase);
                    text = text.Replace("\"", "", StringComparison.InvariantCultureIgnoreCase);

                    return lunchContext.TweetRepo.CreateAsync(new Tweet
                    {
                        Text = text,
                        Time = tweet.CreatedAt.GetEpochSeconds(),
                        Id = tweet.IdStr,
                        TruckId = id,
                    });
                }
                catch
                {
                }

                return null;
            }));
        }

        private List<Location> FindLocations(string text)
        {
            var found = new List<Location>();

            foreach (var location in locations)
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
        private async Task<bool> SearchTweets(IEnumerable<ITweet> tweets)
        {
            var foundLocations = false;

            foreach (var tweet in tweets)
            {
                if (tweet.IsEightHoursOld() && !tweet.ToUser())
                {
                    var text = MakeSubstitutions(tweet.FullText);
                    if (!HasSkipWords(text))
                    {
                        var locations = FindLocations(text);
                        if (locations.Any())
                        {
                            logger.LogDebug($"Locations found {tweets.FirstOrDefault().CreatedBy.ScreenName}");
                            await Task.WhenAll(locations.Select(l =>
                            {
                                return lunchContext.SpotRepo.CreateAsync(new Spot
                                {
                                    TruckId = tweets.FirstOrDefault().CreatedBy.ScreenName.ToLower(),
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
