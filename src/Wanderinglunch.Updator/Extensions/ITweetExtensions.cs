using System;
using Tweetinvi.Models;

namespace Wanderinglunch.Updator.Extensions
{
    public static class ITweetExtensions
    {
        public static bool ToUser(this ITweet tweet)
        {
            return tweet.FullText.StartsWith("@");
        }

        public static bool IsEightHoursOld(this ITweet tweet)
        {
            return tweet.CreatedAt > DateTime.Now.AddHours(-8);
        }
    }
}