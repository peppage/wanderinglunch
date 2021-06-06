using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Core.Entities;
using Wanderinglunch.Data;

namespace Wanderinglunch.Web.Pages
{
    public class TruckModel : PageModel
    {
        private readonly IDbContext lunchContext;
        public Truck Truck { get; set; }
        public IEnumerable<Tweet> Tweets { get; set; }
        public IEnumerable<Image> Images { get; set; }

        public TruckModel(IDbContext lunchContext)
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