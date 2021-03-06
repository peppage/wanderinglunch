using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Wanderinglunch.Core.Entities;
using Wanderinglunch.Data;

namespace Wanderinglunch.Web.Pages
{
    [IgnoreAntiforgeryToken(Order = 1001)]
    public class SubsModel : PageModel
    {
        private readonly IDbContext lunchContext;

        public IEnumerable<Sub> Subs { get; set; }

        public SubsModel(IDbContext lunchContext)
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