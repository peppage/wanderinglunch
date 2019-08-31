using System.Collections.Generic;
using System.Threading.Tasks;
using PetaPoco;
using Wanderinglunch.Data.Interfaces;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Repositories
{
    public class SubRepo : ISubRepo
    {
        private readonly IDatabase db;

        public SubRepo(IDatabase db)
        {
            this.db = db;
        }

        public List<Sub> All() => db.Fetch<Sub>();

        public Task<List<Sub>> AllAsync() => db.FetchAsync<Sub>();

        public Task<object> CreateAsync(Sub sub) => db.InsertAsync(sub);

        public Task<Sub> GetByIdAsync(int id) => db.SingleOrDefaultAsync<Sub>("WHERE id = @0", id);

        public Task<int> SaveAsync(Sub sub) => db.UpdateAsync(sub);
    }
}
