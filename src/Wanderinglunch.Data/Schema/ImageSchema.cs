using Wanderinglunch.Data.Extensions;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Schema
{
    internal static class ImageSchema
    {
        internal static string Table { get; } = $@"{nameof(Image)}s";

        internal static class Columns
        {
            public static string TruckId { get; } = $"{Table}.{nameof(Image.TruckId).ToSnakeCase()}";
            public static string Menu { get; } = $"{Table}.{nameof(Image.Menu).ToSnakeCase()}";
        }
    }
}