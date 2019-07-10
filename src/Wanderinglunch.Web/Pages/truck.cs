using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Web.Pages
{
    public class TruckModel : PageModel
    {
        private readonly ILunchContext lunchContext;
        public Truck Truck { get; set; }
        public List<Tweet> Tweets { get; set; }
        public List<Image> Images { get; set; }

        public TruckModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<IActionResult> OnGetAsync(string id)
        {
            Truck = await lunchContext.TruckRepo.GetByIdAsync(id);
            Tweets = await lunchContext.TweetRepo.GetByTruckIdAsync(id);
            Images = await lunchContext.ImageRepo.ByTruckIdAsync(id);
            return Page();
        }

        public string FormatTime(long epoch)
        {
            var dto = DateTimeOffset.FromUnixTimeSeconds(epoch).ToLocalTime();
            return dto.ToString("ddd MMM d, yyyy hh:mm tt");
        }
    }
}
