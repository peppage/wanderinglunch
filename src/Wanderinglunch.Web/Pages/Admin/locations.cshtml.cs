using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Wanderinglunch.Core.Entities;
using Wanderinglunch.Data;

namespace Wanderinglunch.Web.Pages
{
    [IgnoreAntiforgeryToken(Order = 1001)]
    public class LocationsModel : PageModel
    {
        private readonly ILunchContext lunchContext;

        public IEnumerable<Location> Locations { get; set; }

        public LocationsModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            Locations = await lunchContext.LocationRepo.AllAsync("nyc");
            return Page();
        }

        public async Task<IActionResult> OnPostSearchAsync([FromForm] string search)
        {
            var locations = await lunchContext.LocationRepo.AllAsync("nyc");
            if (string.IsNullOrEmpty(search))
            {
                return Partial("_locationList", locations);
            }

            return Partial("_locationList", locations.Where(l => l.Display.IndexOf(search, StringComparison.OrdinalIgnoreCase) >= 0));
        }
    }
}