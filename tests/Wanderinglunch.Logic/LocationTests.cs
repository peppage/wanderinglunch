using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Logic;

namespace tests.Wanderinglunch.Logic
{
    [TestClass]
    public class LocationTests
    {
        [TestMethod]
        public void FindingLocations()
        {
            var locs = new List<Location>
            {
                new Location
                {
                    Matcher = "9(th)? ?& ?broadway",
                    Site = "nyc",
                },

                new Location
                {
                    Matcher = "55(th)? ?& ?56(th)?",
                    Site = "nyc",
                }
            };

            var found = Locations.FindLocations(locs, "nyc", "We're at 9th & Broadway. Second truck at 55th & 56th.");

            Assert.AreEqual(2, found.Count);
        }

        [TestMethod]
        public void NotFindingLocations()
        {
            var locs = new List<Location>
            {
                new Location
                {
                    Matcher = "7(th) ?& ?nowhere",
                    Site = "nyc",
                }
            };

            var found = Locations.FindLocations(locs, "nyc", "We're here, at nowhere!");

            Assert.AreEqual(0, found.Count);
        }

        [TestMethod]
        public void FindingLocationWrongSite()
        {
            var locs = new List<Location>
            {
                new Location
                {
                    Matcher = "9(th)? ?& ?broadway",
                    Site = "dc",
                },

                new Location
                {
                    Matcher = "55(th)? ?& ?56(th)?",
                    Site = "nyc",
                }
            };

            var found = Locations.FindLocations(locs, "nyc", "We're at 9th & Broadway. Second truck at 55th & 56th.");

            Assert.AreEqual(1, found.Count);
        }

    }
}
