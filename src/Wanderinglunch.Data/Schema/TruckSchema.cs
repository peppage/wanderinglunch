using Wanderinglunch.Data.Models;
using Wanderinglunch.Data.Extensions;

namespace Wanderinglunch.Data.Schema
{
    internal static class TruckSchema
    {
        internal static string Table { get; } = $@"{nameof(Truck)}s";

        internal static class Columns
        {
            public static string Id { get; } = $"{Table}.{nameof(Truck.Id).ToSnakeCase()}";
            public static string Site { get; } = $"{Table}.{nameof(Truck.Site).ToSnakeCase()}";
            public static string Archive { get; } = $"{Table}.{nameof(Truck.Archive).ToSnakeCase()}";
        }
    }
}