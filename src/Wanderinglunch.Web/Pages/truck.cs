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
        public IEnumerable<Tweet> Tweets { get; set; }
        public IEnumerable<Image> Images { get; set; }

        public TruckModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<IActionResult> OnGetAsync(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return NotFound();
            }

            Truck = await lunchContext.TruckRepo.GetByIdAsync(id);

            if (Truck == null)
            {
                return NotFound();
            }

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