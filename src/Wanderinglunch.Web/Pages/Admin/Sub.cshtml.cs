using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Web.Pages
{
    public class SubModel : PageModel
    {
        private readonly ILunchContext lunchContext;

        [BindProperty]
        public Sub Sub { get; set; }

        public SubModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<IActionResult> OnGetAsync(int id)
        {
            if (id == 0)
            {
                Sub = new Sub();
            }
            else
            {
                Sub = await lunchContext.SubRepo.GetByIdAsync(id);
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            if (Sub.Id == 0)
            {
                var id = await lunchContext.SubRepo.CreateAsync(Sub);
                Sub.Id = (long)id;
            }
            else
            {
                await lunchContext.SubRepo.SaveAsync(Sub);
            }

            return LocalRedirect($"/admin/sub/{Sub.Id}");
        }
    }
}
