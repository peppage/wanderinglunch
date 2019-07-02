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

        public List<Sub> All()
        {
            return db.Fetch<Sub>();
        }
    }
}
