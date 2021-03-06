using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Wanderinglunch.Data;

namespace Wanderinglunch.Web.Controllers
{
    public class SitemapController : Controller
    {
        private readonly IDbContext lunchContext;

        public SitemapController(IDbContext lunchContext)
        {
            this.lunchContext = lunchContext;
        }

        [Route("/sitemap.txt")]
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public async Task<IActionResult> Sitemap()
        {
            var map = "";
            foreach (var site in await lunchContext.SiteRepo.GetAllAsync())
            {
                map += $"http://wanderinglunch.com/{site.Name}\n";
                map += $"http://wanderinglunch.com/{site.Name}/map\n";
                map += $"http://wanderinglunch.com/{site.Name}/alltrucks\n";

                foreach (var truck in await lunchContext.TruckRepo.AllAsync(site.Name))
                {
                    map += $"http://wanderinglunch.com/truck/{truck.Id}\n";
                }
            }

            return Content(map);
        }
    }
}