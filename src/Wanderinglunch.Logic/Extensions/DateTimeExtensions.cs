using System;

namespace Wanderinglunch.Logic.Extensions
{
    public static class DateTimeExtensions
    {
        public static int GetEpochSeconds(this DateTime date)
        {
            var t = date.ToUniversalTime() - new DateTime(1970, 1, 1);
            return (int)t.TotalSeconds;
        }
    }
}
