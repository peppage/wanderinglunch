using Wanderinglunch.Data.Interfaces;

namespace Wanderinglunch.Data
{
    public interface ILunchContext
    {
        IUserRepo UserRepo { get; }
        ITruckRepo TruckRepo { get; }
        ITweetRepo TweetRepo { get; }
        ISubRepo SubRepo { get; }
        ILocationRepo LocationRepo { get; }
        ISpotRepo SpotRepo { get; }
    }
}
