using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;

namespace Wanderinglunch.Web.Pages
{
    public class SubsModel : PageModel
    {
        private readonly ILunchContext lunchContext;

        public SubsModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<JsonResult> OnGetSubsAsync()
        {
            var subs = await lunchContext.SubRepo.AllAsync();
            return new JsonResult(subs);
        }
    }
}
