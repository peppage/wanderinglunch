using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Wanderinglunch.Data;

namespace Wanderinglunch.Updator.Services
{
    public class UpdateService : IUpdateService
    {
        private readonly ILunchContext lunchContext;
        private readonly ILogger logger;

        public UpdateService(ILunchContext lunchContext, ILogger<UpdateService> logger)
        {
            this.lunchContext = lunchContext;
            this.logger = logger;
        }

        public async Task Run()
        {
            var trucks = await lunchContext.TruckRepo.All();
            logger.LogDebug($"Total trucks {trucks.Count}");
            foreach (var truck in trucks)
            {
                logger.LogDebug(truck.TwitName);
            }
        }
    }
}
