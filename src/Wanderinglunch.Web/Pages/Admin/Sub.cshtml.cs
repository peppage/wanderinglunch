using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Threading.Tasks;
using Wanderinglunch.Core.Entities;
using Wanderinglunch.Data;

namespace Wanderinglunch.Web.Pages
{
    public class SubModel : PageModel
    {
        private readonly IDbContext lunchContext;

        [BindProperty]
        public Sub Sub { get; set; }

        [TempData]
        public string Message { get; set; }

        public SubModel(IDbContext lunchContext)
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

            try
            {
                if (Sub.Id == 0)
                {
                    var id = await lunchContext.SubRepo.CreateAsync(Sub);
                    Sub.Id = (long)id;
                    Message = "Sub Created";
                }
                else
                {
                    await lunchContext.SubRepo.SaveAsync(Sub);
                    Message = "Sub Updated";
                }
            }
            catch
            {
                Message = "Error!";
            }

            return LocalRedirect($"/admin/sub/{Sub.Id}");
        }
    }
}