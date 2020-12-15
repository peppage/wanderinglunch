using Wanderinglunch.Data.Extensions;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Schema
{
    internal static class SpotSchema
    {
        internal static string Table { get; } = $@"{nameof(Spot)}s";

        internal static class Columns
        {
            public static string TruckId { get; } = $"{Table}.{nameof(Spot.TruckId).ToSnakeCase()}";
            public static string LocationId { get; } = $"{Table}.{nameof(Spot.LocationId).ToSnakeCase()}";
            public static string TweetId { get; } = $"{Table}.{nameof(Spot.TweetId).ToSnakeCase()}";
        }
    }
}