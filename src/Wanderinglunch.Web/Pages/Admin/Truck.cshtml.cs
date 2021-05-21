using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Threading.Tasks;
using Wanderinglunch.Core.Entities;
using Wanderinglunch.Data;

namespace Wanderinglunch.Web.Pages
{
    public class AdminTruckModel : PageModel
    {
        private readonly ILunchContext lunchContext;

        [BindProperty]
        public Truck Truck { get; set; }

        [BindProperty]
        public string OriginalTwitName { get; set; }

        [TempData]
        public string Message { get; set; }

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

            try
            {
                if (string.IsNullOrEmpty(OriginalTwitName))
                {
                    var id = await lunchContext.TruckRepo.CreateAsync(Truck);
                    Message = "Truck created";
                }
                else
                {
                    lunchContext.TruckRepo.Update(Truck);
                    Message = "Updated truck";
                }
            }
            catch
            {
                Message = "Failed!";
            }

            return LocalRedirect($"/admin/truck/{Truck.Id}");
        }
    }
}