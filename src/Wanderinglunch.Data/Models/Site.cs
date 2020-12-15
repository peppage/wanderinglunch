using Dapper.Contrib.Extensions;

namespace Wanderinglunch.Data.Models
{
    [Table("sites")]
    public class Site
    {
        [ExplicitKey]
        public string Name { get; set; }

        public string Title { get; set; }
        public string Description { get; set; }
        public float Lat { get; set; }
        public float Long { get; set; }
    }
}