using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data;
using Wanderinglunch.Logic;
using Wanderinglunch.Web.ViewModels;

namespace Wanderinglunch.Web.Pages
{
    [IgnoreAntiforgeryToken(Order = 1001)]
    public class AdminIndexModel : PageModel
    {
        private readonly IDbContext lunchContext;

        public List<TweetWithLocations> Tweets { get; set; } = new List<TweetWithLocations>();

        public AdminIndexModel(IDbContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            var tweets = await lunchContext.TweetRepo.GetRecentAsync("nyc");
            var subs = await lunchContext.SubRepo.AllAsync();

            var locations = lunchContext.LocationRepo.All();

            foreach (var tweet in tweets)
            {
                tweet.Text = Substitions.DoSubstitions(subs, tweet.Text);

                Tweets.Add(new TweetWithLocations
                {
                    Tweet = tweet,
                    Locations = Locations.FindLocations(locations, "nyc", tweet.Text),
                    Time = FormatTime(tweet.Time),
                });
            }

            return Page();
        }

        private static string FormatTime(long epoch)
        {
            var dto = DateTimeOffset.FromUnixTimeSeconds(epoch).ToLocalTime();
            return dto.ToString("M/d/yy hh:mm tt");
        }

        public async Task<IActionResult> OnPostMarkDoneAsync([FromQuery] string id)
        {
            var tweet = await lunchContext.TweetRepo.GetByIdAsync(id);
            tweet.Done = true;
            await lunchContext.TweetRepo.SaveAsync(tweet);
            return new ContentResult();
        }
    }
}