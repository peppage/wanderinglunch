using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ISubRepo
    {
        List<Sub> All();
    }
}
