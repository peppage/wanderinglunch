using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Linq;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Logic
{
    public static class Locations
    {
        /// <summary>
        /// Find all locations in a text. This is after substitutions.
        /// </summary>
        /// <param name="locs">The locations to search for</param>
        /// <param name="site">The site where the truck is.</param>
        /// <param name="text">The text to search</param>
        /// <returns>A list of found locations</returns>
        public static List<Location> FindLocations(List<Location> locs, string site, string text)
        {
            var found = new List<Location>();

            foreach (var location in locs.Where(l => l.Site == site))
            {
                var regex = new Regex(location.Matcher);
                var match = regex.Match(text);
                if (match.Success)
                {
                    found.Add(location);
                }
            }

            return found;
        }
    }
}
