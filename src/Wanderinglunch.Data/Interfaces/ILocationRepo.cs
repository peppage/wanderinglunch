using System.Collections.Generic;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ILocationRepo
    {
        List<Location> All();
    }
}