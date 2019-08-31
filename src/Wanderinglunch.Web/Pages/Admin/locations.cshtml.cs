using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;

namespace Wanderinglunch.Web.Pages
{
    public class LocationsModel : PageModel
    {
        private readonly ILunchContext lunchContext;

        public LocationsModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<JsonResult> OnGetLocationsAsync()
        {
            var locations = await lunchContext.LocationRepo.AllAsync("nyc");
            return new JsonResult(locations);
        }
    }
}
