using Wanderinglunch.Data.Extensions;
using Wanderinglunch.Data.Models;

namespace Wanderinglunch.Data.Schema
{
    internal class UserSchema
    {
        internal static string Table { get; } = $@"{nameof(User)}s";

        internal static class Columns
        {
            public static string Email { get; } = $"{Table}.{nameof(User.Email).ToSnakeCase()}";
        }
    }
}