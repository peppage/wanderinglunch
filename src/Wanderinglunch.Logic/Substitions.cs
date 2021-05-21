using System.Collections.Generic;
using System.Text.RegularExpressions;
using Wanderinglunch.Core.Entities;

namespace Wanderinglunch.Logic
{
    public static class Substitions
    {
        /// <summary>
        /// Go through a list of substitutions and perform them
        /// all to the text.
        /// </summary>
        /// <param name="subs"></param>
        /// <param name="text"></param>
        /// <returns>The string after all the substitions</returns>
        public static string DoSubstitions(IEnumerable<Sub> subs, string text)
        {
            foreach (var sub in subs)
            {
                var regex = new Regex(sub.Regex);
                text = regex.Replace(text, sub.Replacement);
            }

            return text;
        }
    }
}