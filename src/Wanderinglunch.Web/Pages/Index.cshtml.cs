using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Web.Pages
{
    public class IndexModel : PageModel
    {
        public string Site { get; set; }
        public IEnumerable<FullSpot> Trucks { get; set; }
        public IEnumerable<string> Zones { get; set; }

        private readonly ILunchContext lunchContext;

        public IndexModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public IActionResult OnGet(string site)
        {
            if (string.IsNullOrEmpty(site))
            {
                return Redirect("/nyc");
            }

            Site = site;
            Trucks = lunchContext.SpotRepo.Get(site);
            Zones = Trucks.Select(t => t.Location.Zone).Distinct();
            return Page();
        }

        public IEnumerable<FullSpot> GetTrucks(string zone)
        {
            var trucks = Trucks.Where(t => t.Location.Zone == zone).Distinct(new SpotComparer());
            return trucks.OrderByDescending(t => t.Location.Lat);
        }
    }

    class SpotComparer : IEqualityComparer<FullSpot>
    {
        public bool Equals(FullSpot x, FullSpot y)
        {
            return x.Truck.TwitName == y.Truck.TwitName
            && x.Location.Id == y.Location.Id;
        }

        public int GetHashCode(FullSpot obj)
        {
            return obj.Truck.TwitName.GetHashCode() ^
                obj.Location.Id.GetHashCode();
        }
    }
}
