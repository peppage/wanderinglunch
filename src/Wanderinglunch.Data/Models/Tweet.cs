namespace Wanderinglunch.Data.Models
{
    public class Tweet
    {
        public string Text { get; set; }
        public long Time { get; set; }
        public string Id { get; set; }
        public bool Retweeted { get; set; }
        public string TruckId { get; set; }
        public bool Done { get; set; }
    }
}
