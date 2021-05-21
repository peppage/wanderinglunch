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
    public class TrucksModel : PageModel
    {
        private readonly ILunchContext lunchContext;

        public IEnumerable<Truck> Trucks { get; set; }

        public class SearchParams
        {
            public string Search { get; set; }
        }

        public TrucksModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            Trucks = await lunchContext.TruckRepo.AllAsync("nyc", true);
            return Page();
        }

        public async Task<IActionResult> OnPostSearchAsync([FromForm] string search)
        {
            var trucks = await lunchContext.TruckRepo.AllAsync("nyc", true);
            if (string.IsNullOrEmpty(search))
            {
                return Partial("_truckList", trucks);
            }

            return Partial("_truckList", trucks.Where(t => t.Name.IndexOf(search, StringComparison.OrdinalIgnoreCase) >= 0));
        }
    }
}