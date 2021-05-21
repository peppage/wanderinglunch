using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using Wanderinglunch.Core.Entities;

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
        public static List<Location> FindLocations(IEnumerable<Location> locs, string site, string text)
        {
            var found = new List<Location>();

            foreach (var location in locs.Where(l => l.Site == site))
            {
                var regex = new Regex(location.Matcher);
                var match = regex.Match(text.ToLower());
                if (match.Success)
                {
                    found.Add(location);
                }
            }

            return found;
        }
    }
}