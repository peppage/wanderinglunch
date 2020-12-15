using System.Threading.Tasks;
using Wanderinglunch.Updator.Services;

namespace Wanderinglunch.Updator
{
    public class App
    {
        private readonly IUpdateService updateService;

        public App(IUpdateService updateService)
        {
            this.updateService = updateService;
        }

        public void Run()
        {
            updateService.Run();
        }
    }
}