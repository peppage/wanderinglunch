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

        public object Create(Tweet tweet)
        {
            return db.Insert(tweet);
        }

        public Task<object> CreateAsync(Tweet tweet)
        {
            return db.InsertAsync(tweet);
        }
    }
}
