using Dapper.Contrib.Extensions;

namespace Wanderinglunch.Data.Models
{
    public class User
    {
        [Key]
        public int Id { get; set; }

        public string Email { get; set; }
        public string Password { get; set; }
        public bool Admin { get; set; }
    }
}