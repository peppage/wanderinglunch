﻿using System.Collections.Generic;
using Wanderinglunch.Core.Entities;

namespace Wanderinglunch.Core.Interfaces
{
    public interface ISpotRepo
    {
        object Create(Spot spot);

        IEnumerable<FullSpot> Get(string site, int hours = 8);

        Spot GetByTweetAndLocation(string tweetId, long locationId);
    }
}