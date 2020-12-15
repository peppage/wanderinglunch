using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using Dapper.Contrib.Extensions;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Repositories
{
    public class SubRepo : ISubRepo
    {
        private readonly IDbConnection db;

        public SubRepo(IDbConnection db)
        {
            this.db = db;
        }

        public IEnumerable<Sub> All() => db.GetAll<Sub>();

        public Task<int> CreateAsync(Sub sub) => db.InsertAsync(sub);

        public Sub GetById(int id) => db.Get<Sub>(id);

        public Task<bool> SaveAsync(Sub sub) => db.UpdateAsync(sub);
    }
}