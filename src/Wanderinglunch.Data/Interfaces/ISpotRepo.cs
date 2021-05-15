using System.Collections.Generic;
using System.Threading.Tasks;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Interfaces
{
    public interface ISpotRepo
    {
        object Create(Spot spot);

        IEnumerable<FullSpot> Get(string site, int hours = 8);

        Spot GetByTweetAndLocation(string tweetId, long locationId);
    }
}