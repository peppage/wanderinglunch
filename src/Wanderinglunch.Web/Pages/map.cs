using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Web.Pages
{
    public class MapModel : PageModel
    {
        public string Site { get; set; }
        public float Lat { get; set; }
        public float Long { get; set; }
        public IEnumerable<FullSpot> Trucks { get; set; }

        private readonly ILunchContext lunchContext;

        public MapModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<IActionResult> OnGetAsync(string site)
        {
            Site = site;

            var fullSite = await lunchContext.SiteRepo.GetByNameAsync(Site);
            Lat = fullSite.Lat;
            Long = fullSite.Long;

            Trucks = lunchContext.SpotRepo.Get(site).Distinct(new SpotComparer());

            return Page();
        }
    }
}
