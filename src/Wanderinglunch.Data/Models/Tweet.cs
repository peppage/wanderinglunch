using Dapper.Contrib.Extensions;

namespace Wanderinglunch.Data.Models
{
    public class Tweet
    {
        public string Text { get; set; }
        public long Time { get; set; }

        [ExplicitKey]
        public string Id { get; set; }

        public string TruckId { get; set; }
        public bool Done { get; set; }
    }
}