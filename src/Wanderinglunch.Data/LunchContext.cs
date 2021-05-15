using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Repositories;

namespace Wanderinglunch.Data
{
    public class LunchContext : ILunchContext
    {
        public IUserRepo UserRepo { get; }

        public ITruckRepo TruckRepo { get; }

        public ITweetRepo TweetRepo { get; }

        public ISubRepo SubRepo { get; }

        public ILocationRepo LocationRepo { get; }

        public ISpotRepo SpotRepo { get; }

        public IImageRepo ImageRepo { get; }

        public ISiteRepo SiteRepo { get; }

        public LunchContext(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;

            UserRepo = new UserRepo(connectionString);
            TruckRepo = new TruckRepo(connectionString);
            TweetRepo = new TweetRepo(connectionString);
            SubRepo = new SubRepo(connectionString);
            LocationRepo = new LocationRepo(connectionString);
            SpotRepo = new SpotRepo(connectionString);
            ImageRepo = new ImageRepo(connectionString);
            SiteRepo = new SiteRepo(connectionString);
        }
    }
}