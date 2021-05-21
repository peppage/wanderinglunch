namespace Wanderinglunch.Core.Entities
{
    public class Spot
    {
        public string TruckId { get; set; }
        public long LocationId { get; set; }
        public string TweetId { get; set; }
    }

    public class FullSpot
    {
        public Truck Truck { get; set; }
        public Location Location { get; set; }
        public Tweet Tweet { get; set; }
        public Image Image { get; set; }
    }
}