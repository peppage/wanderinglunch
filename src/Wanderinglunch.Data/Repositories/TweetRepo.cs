using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using Dapper;
using Dapper.Contrib.Extensions;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Data.Schema;

namespace Wanderinglunch.Data.Repositories
{
    public class TweetRepo : ITweetRepo
    {
        private readonly IDbConnection db;

        public TweetRepo(IDbConnection db)
        {
            this.db = db;
        }

        public void Create(Tweet tweet) => db.Insert(tweet);

        public Task SaveAsync(Tweet tweet) => db.UpdateAsync(tweet);

        public Task<IEnumerable<Tweet>> GetByTruckIdAsync(string id)
        {
            var sql = $@"SELECT * FROM {TweetSchema.Table} WHERE {TweetSchema.Columns.TruckId} = @id ORDER BY {TweetSchema.Columns.Time} DESC";
            return db.QueryAsync<Tweet>(sql, new { id });
        }

        public Task<IEnumerable<Tweet>> GetRecentAsync(string site, bool includeNotDone = false, int amount = 35)
        {
            var dynamicParams = new DynamicParameters();

            var sql = $@"SELECT * FROM {TweetSchema.Table} LEFT JOIN {TruckSchema.Table}
                        ON {TweetSchema.Columns.TruckId} = {TruckSchema.Columns.Id}
                        WHERE {TruckSchema.Columns.Site} = @site ";
            dynamicParams.Add("site", site);

            if (!includeNotDone)
            {
                sql += $@"AND {TweetSchema.Columns.Done} = @done ";
                dynamicParams.Add("done", false);
            }

            sql += $@"ORDER BY {TweetSchema.Columns.Time} DESC LIMIT @limit";
            dynamicParams.Add("limit", amount);

            return db.QueryAsync<Tweet>(sql, dynamicParams);
        }

        public Tweet GetById(string id) => db.Get<Tweet>(id);
    }
}