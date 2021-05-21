using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;
using Wanderinglunch.Core.Entities;

namespace Wanderinglunch.Web.Pages
{
    public class LocationModel : PageModel
    {
        private readonly ILunchContext lunchContext;

        [BindProperty]
        public Location Location { get; set; }

        [TempData]
        public string Message { get; set; }

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
                Location = await lunchContext.LocationRepo.GetByIdAsync(id);
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            try
            {
                if (Location.Id == 0)
                {
                    var id = await lunchContext.LocationRepo.CreateLocationAsync(Location);
                    Location.Id = (long)id;
                    Message = "Location created";
                }
                else
                {
                    await lunchContext.LocationRepo.SaveLocationAsync(Location);
                    Message = "Location saved";
                }
            }
            catch
            {
                Message = "Failed!";
            }

            return LocalRedirect($"/admin/location/{Location.Id}");
        }
    }
}