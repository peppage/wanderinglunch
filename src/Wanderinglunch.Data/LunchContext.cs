using PetaPoco;
using PetaPoco.Providers;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Repositories;

namespace Wanderinglunch.Data
{
    public class LunchContext : ILunchContext
    {
        private readonly IDatabase db;

        public IUserRepo UserRepo { get; private set; }

        public ITruckRepo TruckRepo { get; private set; }

        public ITweetRepo TweetRepo { get; private set; }

        public ISubRepo SubRepo { get; private set; }

        public ILocationRepo LocationRepo { get; private set; }

        public ISpotRepo SpotRepo { get; private set; }

        public IImageRepo ImageRepo { get; private set; }

        public ISiteRepo SiteRepo { get; private set; }

        public LunchContext(string connectionString)
        {
            db = DatabaseConfiguration.Build()
                .UsingConnectionString(connectionString)
                .UsingProvider<PostgreSQLDatabaseProvider>()
                .UsingDefaultMapper<ConventionMapper>(m =>
                {
                    m.InflectTableName = (inflector, TableNameAttribute) => inflector.Pluralise(inflector.Underscore(TableNameAttribute));
                    m.InflectColumnName = (inflector, s) => inflector.Underscore(s);
                }).Create();

            UserRepo = new UserRepo(db);
            TruckRepo = new TruckRepo(db);
            TweetRepo = new TweetRepo(db);
            SubRepo = new SubRepo(db);
            LocationRepo = new LocationRepo(db);
            SpotRepo = new SpotRepo(db);
            ImageRepo = new ImageRepo(db);
            SiteRepo = new SiteRepo(db);
        }

    }
}
