using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wanderinglunch.Data;
using Wanderinglunch.Data.Models;

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

        public IActionResult OnGet()
        {
            Subs = lunchContext.SubRepo.All();
            return Page();
        }

        public IActionResult OnPostSearch([FromForm] string search)
        {
            var subs = lunchContext.SubRepo.All();
            if (string.IsNullOrEmpty(search))
            {
                return Partial("_subList", subs);
            }

            return Partial("_subList", subs.Where(s => s.Replacement.IndexOf(search, StringComparison.OrdinalIgnoreCase) >= 0));
        }
    }
}