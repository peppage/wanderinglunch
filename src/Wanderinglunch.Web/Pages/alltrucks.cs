using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Wanderinglunch.Core.Entities;
using Wanderinglunch.Data;
using Wanderinglunch.Logic;

namespace Wanderinglunch.Web.Pages
{
    public class AllTrucksModel : PageModel
    {
        public string Site { get; set; }
        private readonly IDbContext lunchContext;
        public IEnumerable<Truck> Trucks { get; set; }
        public IEnumerable<Image> Menus { get; set; }

        public AllTrucksModel(IDbContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<IActionResult> OnGetAsync(string site)
        {
            Site = site;
            if (!ValidSite(Site))
            {
                return NotFound();
            }

            Trucks = await lunchContext.TruckRepo.AllAsync(site, true);
            Trucks = Trucks.OrderBy(t => t.Archive).ThenBy(t => t.Name);

            Menus = await lunchContext.ImageRepo.GetMenusAsync();

            return Page();
        }

        public string RelativeTime(long epoch)
        {
            return Time.RelativeTime(epoch);
        }

        private bool ValidSite(string site)
        {
            var s = lunchContext.SiteRepo.GetByName(site);
            return s != null;
        }
    }
}