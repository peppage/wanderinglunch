using System.Collections.Generic;
using Wanderinglunch.Core.Entities;

namespace Wanderinglunch.Web.ViewModels
{
    public class TweetWithLocations
    {
        public Tweet Tweet { get; set; }
        public IEnumerable<Location> Locations { get; set; }
        public string Time { get; set; }
    }
}