using System.Threading.Tasks;

namespace Wanderinglunch.Updater.Services
{
    public interface IUpdateService
    {
        Task RunAsync();
    }
}