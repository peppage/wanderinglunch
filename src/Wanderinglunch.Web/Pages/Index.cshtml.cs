using System;
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

        const int SECOND = 1;
        const int MINUTE = 60 * SECOND;
        const int HOUR = 60 * MINUTE;
        DateTime epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);

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

        public string RelativeTime(long truckEpoch)
        {
            var truckTime = epoch.AddSeconds(truckEpoch);
            var ts = new TimeSpan(DateTime.UtcNow.Ticks - truckTime.Ticks);
            var delta = Math.Abs(ts.TotalSeconds);

            if (delta < 1 * MINUTE)
            {
                return ts.Seconds == 1 ? "one second ago" : $"{ts.Seconds} second ago";
            }

            if (delta < 2 * MINUTE)
            {
                return "a minute ago";
            }

            if (delta < 45 * MINUTE)
            {
                return $"{ts.Minutes} minutes ago";
            }

            if (delta < 90 * MINUTE)
            {
                return "an hour ago";
            }

            if (delta < 24 * HOUR)
            {
                return $"{ts.Hours} hours ago";
            }

            else return $"{ts.Days} days ago";
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
