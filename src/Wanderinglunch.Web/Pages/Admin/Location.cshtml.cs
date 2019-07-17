using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Web.Pages
{
    public class LocationModel : PageModel
    {
        private readonly ILunchContext lunchContext;

        [BindProperty]
        public Location Location { get; set; }

        public LocationModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<IActionResult> OnGetAsync(int id)
        {
            if (id == 0)
            {
                Location = new Location();
            }
            else
            {
                Location = await lunchContext.LocationRepo.GetById(id);
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            if (Location.Id == 0)
            {
                var id = await lunchContext.LocationRepo.CreateLocationAsync(Location);
                Location.Id = (long)id;
            }
            else
            {
                await lunchContext.LocationRepo.SaveLocationAsync(Location);
            }

            return LocalRedirect($"/admin/location/{Location.Id}");
        }
    }
}
