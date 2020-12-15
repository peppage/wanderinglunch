using Wanderinglunch.Data.Schema;

namespace Wanderinglunch.Data.Queries
{
    internal static class SpotQueries
    {
        internal static string NewSpots = $@"
            SELECT * FROM {SpotSchema.Table}
                LEFT JOIN {TruckSchema.Table} ON {SpotSchema.Columns.TruckId}= {TruckSchema.Columns.Id}
                LEFT JOIN {LocationSchema.Table} ON {SpotSchema.Columns.LocationId} = {LocationSchema.Columns.Id}
                LEFT JOIN {TweetSchema.Table} ON {SpotSchema.Columns.TweetId} = {TweetSchema.Columns.Id}
                LEFT JOIN (SELECT * FROM {ImageSchema.Table} WHERE {ImageSchema.Columns.Menu} = 1) as images
                    on {SpotSchema.Columns.TruckId} = {ImageSchema.Columns.TruckId}
            WHERE {TweetSchema.Columns.Time} > @time
            AND {TruckSchema.Columns.Site} = @site
            AND {TruckSchema.Columns.Archive} = 0;
        ";
    }
}