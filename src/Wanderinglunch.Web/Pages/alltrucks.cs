using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Web.Pages
{
    public class AllTrucksModel : PageModel
    {
        public string Site { get; set; }
        private readonly ILunchContext lunchContext;
        public List<Truck> Trucks { get; set; }

        public AllTrucksModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task OnGetAsync(string site)
        {
            Site = site;
            Trucks = await lunchContext.TruckRepo.AllAsync(site, false);
        }
    }
}
