using PetaPoco;

namespace Wanderinglunch.Data.Models
{
    [PrimaryKey("twit_name")]
    public class Truck
    {
        public string Name { get; set; }
        public string TwitName { get; set; }

        private string _webURL;
        public string WebURL
        {
            get => _webURL;
            set
            {
                if (value == null)
                {
                    _webURL = "";
                }
                else
                {
                    _webURL = value;
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
