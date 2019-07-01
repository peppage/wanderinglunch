using Wanderinglunch.Data.Interfaces;

namespace Wanderinglunch.Data
{
    public interface ILunchContext
    {
        IUserRepo UserRepo { get; }
        ITruckRepo TruckRepo { get; }
    }
}
