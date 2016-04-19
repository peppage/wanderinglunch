drop table truckstats;


create table ads(id serial, name varchar(255) not null, value text not null,
	validuntil int, views int default 0, site text not null, shape text);
insert into ads (name, value, validuntil, site, shape) VALUES ('test1', 't1111', 1448913433, 'nyc', 'banner');
insert into ads (name, value, validuntil, site, shape) VALUES ('test2', 't2222', 1443643033, 'nyc', 'banner');
insert into ads (name, value, validuntil, site, shape) VALUES ('google-banner', '<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script><ins class="adsbygoogle" style="display:inline-block;width:728px;height:90px" data-ad-client="ca-pub-4098082757736151" data-ad-slot="3902951461"></ins><script>(adsbygoogle = window.adsbygoogle || []).push({});</script>', 2147483647, 'all', 'banner');

insert into ads (name, value, validuntil, site, shape) VALUES ('google-square', '<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script><ins class="adsbygoogle" style="display:inline-block;width:300px;height:250px" data-ad-client="ca-pub-4098082757736151" data-ad-slot="1938459065"></ins><script>(adsbygoogle = window.adsbygoogle || []).push({});</script>', 2147483647, 'all', 'square');


create table zones(zoneid serial, zonename text not null, zoneorder int)

https://twitter.com/mordisfoodtruck
https://twitter.com/TheIncrediballs
https://twitter.com/mecasajc
https://twitter.com/thegreenradish1
https://twitter.com/theAngryCrabNJ
https://twitter.com/AmandaBananasNJ
https://twitter.com/OSM_NJ
https://twitter.com/choppingblockft
https://twitter.com/Food_Samurai/status/638382524746629120

# V3

update trucks set retweeted=false where retweeted is null;
alter table trucks alter column retweeted set default false;
alter table trucks alter column retweeted set NOT NULL;

update trucks set matcher='' where matcher is null;
alter table trucks alter column matcher set default '';
alter table trucks alter column matcher set NOT NULL;

update trucks set matchmethod='' where matchmethod is null;
alter table trucks alter column matchmethod set default '';
alter table trucks alter column matchmethod set NOT NULL;

update trucks set about='' where about is null;
alter table trucks alter column about set default '';
alter table trucks alter column about set NOT NULL;

update trucks set lasttweet=0 where lasttweet is null;
alter table trucks alter column lasttweet set default 0;
alter table trucks alter column lasttweet set NOT NULL;

update trucks set loc=0 where loc is null;
alter table trucks alter column loc set default 0;
alter table trucks alter column loc set NOT NULL;

update trucks set type='' where type is null;
alter table trucks alter column type set default '';
alter table trucks alter column type set NOT NULL;

update trucks set tweet='' where tweet is null;
alter table trucks alter column tweet set default '';
alter table trucks alter column tweet set NOT NULL;

update trucks set lastupdate=0 where lastupdate is null;
alter table trucks alter column lastupdate set default 0;
alter table trucks alter column lastupdate set NOT NULL;

delete from trucks where id='gorilla2';
delete from trucks where id='schnitzelcart';
delete from trucks where id='wafelMomma';

alter table tweets rename contents to text;
alter table trucks add locs bigint[];

create table sites (name TEXT, title text);
insert into sites VALUES('nyc', 'NYC Food Truck Finder');

alter table trucks drop column loc;
alter table trucks drop column matcher;
alter table trucks drop column matchmethod;

alter table ads drop column shape;
delete from ads where id=2;

update locations set matcher='46 ?(th|st)? (between ?)?(5th ?& ?6(th)?|5 ?& ?6|& 5~6)' where id=14;
update locations set matcher='49th between ?(6th & 7th|6 ?& ?7)' where id=21;
update locations set matcher='(dumbolot|(water|jay) & (jay|water))' where id=54;
delete from locations where id=57;
update locations set matcher='(10 hanover sq|7 Hanover sq)' where id=52;
update locations set display='Hanover sq' where id=52;
delete from locations where id=53

update trucks set name='Gorilla Cheese' where twitname='gcnyc1';

alter table trucks drop column lasttweet;