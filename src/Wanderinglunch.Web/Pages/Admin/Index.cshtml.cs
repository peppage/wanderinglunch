using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Logic;

namespace Wanderinglunch.Web.Pages
{
    public class AdminIndexModel : PageModel
    {
        private readonly ILunchContext lunchContext;
        public List<Tweet> Tweets;
        private List<Location> LocationList;

        public AdminIndexModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }
        public async Task OnGetAsync()
        {
            Tweets = await lunchContext.TweetRepo.GetRecentAsync();
            var subs = await lunchContext.SubRepo.AllAsync();

            foreach (var tweet in Tweets)
            {
                tweet.Text = Substitions.DoSubstitions(subs, tweet.Text);
            }

            LocationList = lunchContext.LocationRepo.All();
        }

        public List<Location> FindLocations(string text)
        {
            return Locations.FindLocations(LocationList, "nyc", text);
        }
    }
}
