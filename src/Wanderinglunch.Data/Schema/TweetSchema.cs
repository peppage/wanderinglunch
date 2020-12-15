using Wanderinglunch.Data.Extensions;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Schema
{
    internal static class TweetSchema
    {
        internal static string Table { get; } = $@"{nameof(Tweet)}s";

        internal static class Columns
        {
            public static string Id { get; } = $"{Table}.{nameof(Tweet.Id).ToSnakeCase()}";
            public static string TruckId { get; } = $"{Table}.{nameof(Tweet.TruckId).ToSnakeCase()}";
            public static string Done { get; } = $"{Table}.{nameof(Tweet.Done).ToSnakeCase()}";
            public static string Time { get; } = $"{Table}.{nameof(Tweet.Time).ToSnakeCase()}";
        }
    }
}