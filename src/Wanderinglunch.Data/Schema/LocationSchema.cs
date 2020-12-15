using Wanderinglunch.Data.Extensions;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Schema
{
    internal static class LocationSchema
    {
        internal static string Table { get; } = $@"{nameof(Location)}s";

        internal static class Columns
        {
            public static string Id { get; } = $"{Table}.{nameof(Location.Id).ToSnakeCase()}";
            public static string Site { get; } = $"{Table}.{nameof(Location.Site).ToSnakeCase()}";
        }
    }
}