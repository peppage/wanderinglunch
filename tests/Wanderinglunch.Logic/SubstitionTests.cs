using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using Wanderinglunch.Data.Models;
using Wanderinglunch.Logic;

namespace tests.Wanderinglunch.Logic
{
    [TestClass]
    public class SubstitionTests
    {
        [TestMethod]
        public void DoingSubstitions()
        {
            var subs = new List<Sub>
            {
                new Sub
                {
                    Regex = " ?is a ?",
                    Replacement = "no",
                },

                new Sub
                {
                    Regex = "&amp;",
                    Replacement = "&",
                }
            };

            var text = Substitions.DoSubstitions(subs, "This is a &amp; test");

            Assert.AreEqual("Thisno& test", text);
        }
    }
}
