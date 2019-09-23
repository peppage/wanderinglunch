namespace Wanderinglunch.Data.Models
{
    public class Sub
    {
        public long Id { get; set; }
        public string Regex { get; set; }

        private string _replacement;
        public string Replacement
        {
            get => _replacement;
            set
            {
                if (value == null)
                {
                    _replacement = "";
                }
                else
                {
                    _replacement = value;
                }
            }
        }
    }
}
