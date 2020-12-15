namespace Wanderinglunch.Data.Queries
{
    internal static class SpotQueries
    {
        internal const string NewSpots = @"
            SELECT * FROM spots
                LEFT JOIN trucks ON spots.truck_id = twit_name
                LEFT JOIN locations ON spots.location_id = locations.id
                LEFT JOIN tweets ON spots.tweet_id = tweets.id
                LEFT JOIN (select * from images where menu = 't') as images
                    on spots.truck_id = images.truck_id
            WHERE tweets.time > @0
            AND trucks.site = @1
            AND trucks.archive = 'f';
        ";
    }
}
