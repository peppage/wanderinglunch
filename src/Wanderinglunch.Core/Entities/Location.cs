namespace Wanderinglunch.Core.Entities
{
    public class Location
    {
        public long Id { get; set; }
        public string Display { get; set; }
        public string Matcher { get; set; }
        public float Lat { get; set; }
        public float Long { get; set; }
        public string Zone { get; set; }
        public string Site { get; set; }
    }
}