using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;
using Wanderinglunch.Core.Entities;

namespace Wanderinglunch.Web.Pages
{
    [IgnoreAntiforgeryToken(Order = 1001)]
    public class SubsModel : PageModel
    {
        private readonly ILunchContext lunchContext;

        public IEnumerable<Sub> Subs { get; set; }

        public SubsModel(ILunchContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            Subs = await lunchContext.SubRepo.AllAsync();
            return Page();
        }

        public async Task<IActionResult> OnPostSearchAsync([FromForm] string search)
        {
            var subs = await lunchContext.SubRepo.AllAsync();
            if (string.IsNullOrEmpty(search))
            {
                return Partial("_subList", subs);
            }

            return Partial("_subList", subs.Where(s => s.Replacement.IndexOf(search, StringComparison.OrdinalIgnoreCase) >= 0));
        }
    }
}