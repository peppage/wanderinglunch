using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;

namespace Wanderinglunch.Web.Pages
{
    public class TrucksModel : PageModel
    {
        private readonly ILunchContext lunchContext;

        public TrucksModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<JsonResult> OnGetDataAsync()
        {
            var trucks = await lunchContext.TruckRepo.AllAsync("nyc", true);
            return new JsonResult(trucks);
        }
    }
}
