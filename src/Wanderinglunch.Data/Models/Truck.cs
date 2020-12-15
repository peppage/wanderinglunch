using Dapper.Contrib.Extensions;

namespace Wanderinglunch.Data.Models
{
    [Table("trucks")]
    public class Truck
    {
        public string Name { get; set; }

        [ExplicitKey]
        public string Id { get; set; }

        private string _webUrl;

        public string WebUrl
        {
            get => _webUrl;
            set
            {
                if (value == null)
                {
                    _webUrl = "";
                }
                else
                {
                    _webUrl = value;
                }
            }
        }

        public long LastUpdate { get; set; }
        public string Type { get; set; }

        private string _about;

        public string About
        {
            get => _about;
            set
            {
                if (value == null)
                {
                    _about = "";
                }
                else
                {
                    _about = value;
                }
            }
        }

        public string Foursquare { get; set; }
        public string Site { get; set; }
        public bool Archive { get; set; }
    }
}