using System;

namespace Wanderinglunch.Logic
{
    public static class Time
    {
        private const int SECOND = 1;
        private const int MINUTE = 60 * SECOND;
        private const int HOUR = 60 * MINUTE;

        public static string RelativeTime(long truckEpoch)
        {
            var epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);

            var truckTime = epoch.AddSeconds(truckEpoch);
            var ts = new TimeSpan(DateTime.UtcNow.Ticks - truckTime.Ticks);
            var delta = Math.Abs(ts.TotalSeconds);

            if (delta < 1 * MINUTE)
            {
                return ts.Seconds == 1 ? "one second ago" : $"{ts.Seconds} second ago";
            }

            if (delta < 2 * MINUTE)
            {
                return "a minute ago";
            }

            if (delta < 45 * MINUTE)
            {
                return $"{ts.Minutes} minutes ago";
            }

            if (delta < 90 * MINUTE)
            {
                return "an hour ago";
            }

            if (delta < 24 * HOUR)
            {
                return $"{ts.Hours} hours ago";
            }

            else return $"{ts.Days} days ago";
        }
    }
}
