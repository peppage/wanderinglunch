using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Logic;

namespace Wanderinglunch.Web.Pages
{
    public class AllTrucksModel : PageModel
    {
        public string Site { get; set; }
        private readonly ILunchContext lunchContext;
        public IEnumerable<Truck> Trucks { get; set; }
        public IEnumerable<Image> Menus { get; set; }

        public AllTrucksModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<IActionResult> OnGetAsync(string site)
        {
            Site = site;
            Trucks = await lunchContext.TruckRepo.AllAsync(site, true);
            Trucks = Trucks.OrderBy(t => t.Name);

            Menus = await lunchContext.ImageRepo.GetMenusAsync();

            return Page();
        }

        public string RelativeTime(long epoch)
        {
            return Time.RelativeTime(epoch);
        }
    }
}
