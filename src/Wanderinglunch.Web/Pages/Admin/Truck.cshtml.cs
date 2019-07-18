using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Web.Pages
{
    public class AdminTruckModel : PageModel
    {
        private readonly ILunchContext lunchContext;

        [BindProperty]
        public Truck Truck { get; set; }

        [BindProperty]
        public string OriginalTwitName { get; set; }

        public AdminTruckModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<IActionResult> OnGetAsync(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                Truck = new Truck();
            }
            else
            {
                OriginalTwitName = id;
                Truck = await lunchContext.TruckRepo.GetByIdAsync(id);
            }

            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            if (string.IsNullOrEmpty(Truck.About))
            {
                Truck.About = "";
            }

            if (string.IsNullOrEmpty(OriginalTwitName))
            {
                var id = await lunchContext.TruckRepo.CreateAsync(Truck);
            }
            else
            {
                await lunchContext.TruckRepo.UpdateAsync(Truck);
            }

            return LocalRedirect($"/admin/truck/{Truck.TwitName}");
        }
    }
}
