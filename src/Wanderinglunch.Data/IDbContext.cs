using Wanderinglunch.Core.Interfaces;

namespace Wanderinglunch.Data
{
    public interface IDbContext
    {
        IUserRepo UserRepo { get; }
        ITruckRepo TruckRepo { get; }
        ITweetRepo TweetRepo { get; }
        ISubRepo SubRepo { get; }
        ILocationRepo LocationRepo { get; }
        ISpotRepo SpotRepo { get; }
        IImageRepo ImageRepo { get; }
        ISiteRepo SiteRepo { get; }
    }
}