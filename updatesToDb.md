drop table truckstats;


create table ads(id serial, name varchar(255) not null, value text not null,
	validuntil int, views int default 0, site text not null, shape text);
insert into ads (name, value, validuntil, site, shape) VALUES ('test1', 't1111', 1448913433, 'nyc', 'banner');
insert into ads (name, value, validuntil, site, shape) VALUES ('test2', 't2222', 1443643033, 'nyc', 'banner');
insert into ads (name, value, validuntil, site, shape) VALUES ('google-banner', '<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script><ins class="adsbygoogle" style="display:inline-block;width:728px;height:90px" data-ad-client="ca-pub-4098082757736151" data-ad-slot="3902951461"></ins><script>(adsbygoogle = window.adsbygoogle || []).push({});</script>', 2147483647, 'all', 'banner');

insert into ads (name, value, validuntil, site, shape) VALUES ('google-square', '<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script><ins class="adsbygoogle" style="display:inline-block;width:300px;height:250px" data-ad-client="ca-pub-4098082757736151" data-ad-slot="1938459065"></ins><script>(adsbygoogle = window.adsbygoogle || []).push({});</script>', 2147483647, 'all', 'square');


https://twitter.com/mordisfoodtruck
https://twitter.com/TheIncrediballs
https://twitter.com/mecasajc
https://twitter.com/thegreenradish1
https://twitter.com/theAngryCrabNJ
https://twitter.com/AmandaBananasNJ
https://twitter.com/OSM_NJ
https://twitter.com/choppingblockft
https://twitter.com/Food_Samurai/status/638382524746629120
