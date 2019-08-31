using PetaPoco;

namespace Wanderinglunch.Data.Models
{
    [PrimaryKey("twit_name")]
    public class Truck
    {
        public string Name { get; set; }
        public string TwitName { get; set; }
        public string WebURL { get; set; }
        public long LastUpdate { get; set; }
        public string Type { get; set; }
        public string About { get; set; }
        public string Foursquare { get; set; }
        public string Site { get; set; }
        public bool Archive { get; set; }
    }
}
