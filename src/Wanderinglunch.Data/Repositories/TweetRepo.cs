using Dapper;
using Npgsql;
using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Core.Entities;
using Wanderinglunch.Core.Interfaces;

namespace Wanderinglunch.Data.Repositories
{
    public class TweetRepo : ITweetRepo
    {
        private readonly string connString;

        public TweetRepo(string connString)
        {
            this.connString = connString;
        }

        public void Create(Tweet tweet)
        {
            using var conn = new NpgsqlConnection(connString);
            conn.Open();
            const string sql = @"INSERT INTO tweets
                        (text, time, id, truck_id, done)
                        VALUES
                        (@Text, @Time, @Id, @TruckId, @Done)";
            conn.Execute(sql, tweet);
        }

        public async Task SaveAsync(Tweet tweet)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            const string sql = @"UPDATE tweets SET
                        (text, time, id, truck_id, done) = (@Text, @Time, @Id, @TruckId, @Done)
                        WHERE
                        id = @Id";
            await conn.ExecuteAsync(sql, tweet);
        }

        public async Task<Tweet> GetByIdAsync(string id)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            return await conn.QueryFirstAsync<Tweet>("SELECT * FROM tweets WHERE id=@id", new { id });
        }

        public async Task<IEnumerable<Tweet>> GetByTruckIdAsync(string id)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();
            return await conn.QueryAsync<Tweet>("SELECT * FROM tweets WHERE truck_id=@id ORDER BY time DESC", new { id });
        }

        public async Task<IEnumerable<Tweet>> GetRecentAsync(string site, bool includeNotDone = false, int amount = 35)
        {
            await using var conn = new NpgsqlConnection(connString);
            await conn.OpenAsync();

            var sql = "SELECT * FROM tweets LEFT JOIN trucks ON tweets.truck_id = trucks.id WHERE site = @site ";
            var dynamicParams = new DynamicParameters();
            dynamicParams.Add("site", site);

            if (!includeNotDone)
            {
                sql += "AND done = @done ";
                dynamicParams.Add("done", false);
            }

            sql += "ORDER BY time DESC LIMIT @limit";
            dynamicParams.Add("limit", amount);

            return await conn.QueryAsync<Tweet>(sql, dynamicParams);
        }

        public Tweet GetById(string id)
        {
            using var conn = new NpgsqlConnection(connString);
            conn.Open();
            return conn.QueryFirstOrDefault<Tweet>("SELECT * FROM tweets WHERE id=@id", new { id });
        }
    }
}