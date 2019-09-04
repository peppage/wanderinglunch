using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;
using Wanderinglunch.Logic;

namespace Wanderinglunch.Web.Pages
{
    public class AdminIndexModel : PageModel
    {
        private readonly ILunchContext lunchContext;

        public AdminIndexModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public class DoneRequest
        {
            public string Id { get; set; }
        }

        public string FormatTime(long epoch)
        {
            var dto = DateTimeOffset.FromUnixTimeSeconds(epoch).ToLocalTime();
            return dto.ToString("M/d/yy hh:mm tt");
        }

        public async Task<JsonResult> OnGetTweetsAsync()
        {
            var tweetsWithLocations = new List<object>();

            var tweets = await lunchContext.TweetRepo.GetRecentAsync("nyc");
            var subs = await lunchContext.SubRepo.AllAsync();

            var locations = lunchContext.LocationRepo.All();

            foreach (var tweet in tweets)
            {
                tweet.Text = Substitions.DoSubstitions(subs, tweet.Text);

                tweetsWithLocations.Add(new
                {
                    tweet = tweet,
                    locations = Locations.FindLocations(locations, "nyc", tweet.Text),
                    time = FormatTime(tweet.Time),
                });
            }

            return new JsonResult(tweetsWithLocations);
        }

        public async Task<IActionResult> OnPostMarkDoneAsync([FromBody] DoneRequest req)
        {
            var tweet = await lunchContext.TweetRepo.GetByIdAsync(req.Id);
            tweet.Done = true;
            await lunchContext.TweetRepo.SaveAsync(tweet);
            return null;
        }
    }
}
