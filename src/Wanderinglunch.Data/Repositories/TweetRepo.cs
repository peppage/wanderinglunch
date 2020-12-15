using System.Collections.Generic;
using System.Threading.Tasks;
using PetaPoco;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Repositories
{
    public class TweetRepo : ITweetRepo
    {
        private readonly IDatabase db;

        public TweetRepo(IDatabase db)
        {
            this.db = db;
        }

        public void Create(Tweet tweet) => db.Insert(tweet);

        public Task SaveAsync(Tweet tweet) => db.SaveAsync(tweet);

        public Task<Tweet> GetByIdAsync(string id) => db.SingleOrDefaultAsync<Tweet>("WHERE id = @0", id);

        public Task<List<Tweet>> GetByTruckIdAsync(string id) => db.FetchAsync<Tweet>("WHERE truck_id = @0 ORDER BY time DESC", id);

        public Task<List<Tweet>> GetRecentAsync(string site, bool includeNotDone = false, int amount = 35)
        {
            var sql = PetaPoco.Sql.Builder
                .Append("SELECT * FROM tweets")
                .Append("LEFT JOIN trucks ON tweets.truck_id = trucks.twit_name")
                .Append("WHERE site = @0", site);

            if (!includeNotDone)
            {
                sql.Append("AND done = @0", false);
            }

            sql.Append("ORDER BY time DESC LIMIT @0", amount);

            return db.FetchAsync<Tweet>(sql);
        }

        public Tweet GetById(string id) => db.SingleOrDefault<Tweet>("WHERE id = @0", id);
    }
}
