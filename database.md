# 5.0.0

drop table ads;
drop table messages;
alter table images add primary key (id);
alter table locations add primary key (id);
alter table subs add primary key (id);
alter table tweets add primary key (id);
alter table users add primary key (id);
alter table tweets alter column time set data type bigint;
alter table subs alter column replacement set not null;

create table spots (
truck_id text references trucks(twitname) NOT NULl,
location_id bigint references locations(id) NOT NULL,
tweet_id bigint references tweets(id) NOT NULL,
primary key (location_id, tweet_id)
);
