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

alter table tweets alter column id type text using id::text;

create table spots (
truck_id text references trucks(twitname) NOT NULl,
location_id bigint references locations(id) NOT NULL,
tweet_id text references tweets(id) NOT NULL,
primary key (location_id, tweet_id)
);

alter table images rename column twitname to truck_id;
update images set truck_id='shukanyc' where truck_id='shuka';
delete from images where truck_id = 'burgersandbites';
delete from images where truck_id = 'itizyicecream';
update images set truck_id='snowdaytruck' where truck_id='snowday';
delete from images where truck_id = 'steaksncrepes';
delete from images where truck_id = 'mooshugrill';
delete from images where truck_id = 'rickshawtruck';
delete from images where truck_id = 'tacobite';
delete from images where truck_id = 'goburger';
delete from images where truck_id = 'wingnitnyc';
delete from images where truck_id = 'morristruck';
delete from images where truck_id = 'ritoloco';

ALTER TABLE images
ADD CONSTRAINT images_truck_id_fkey
FOREIGN KEY (truck_id)
REFERENCES trucks(twitname);

alter table trucks alter weburl SET NOT NULL;
alter table trucks alter weburl SET default '';
alter table trucks alter foursquare SET NOT NULL;
alter table trucks alter foursquare SET default '';

ALTER TABLE tweets rename column twitname to truck_id;

ALTER TABLE tweets
ADD CONSTRAINT tweets_truck_id_fkey
FOREIGN KEY (truck_id)
REFERENCES trucks(twitname);

alter table sites alter lat SET NOT NULL;
alter table sites alter long SET NOT NULL;

alter table trucks alter archive SET NOT NULL;

CREATE SEQUENCE subs_id_seq;
ALTER TABLE subs ALTER COLUMN id SET DEFAULT nextval('subs_id_seq');
ALTER TABLE subs ALTER COLUMN id SET NOT NULL;
ALTER SEQUENCE subs_id_seq OWNED BY subs.id;

SELECT MAX(id) FROM subs;
SELECT setval('subs_id_seq', 25);

alter table trucks alter column lastupdate type bigint using lastupdate::bigint;

alter table tweets alter done SET NOT NULL;
alter table tweets alter done SET DEFAULT 'f';

alter table sites alter title SET default '';
alter table sites alter title SET NOT NULL;
alter table sites alter description SET default '';
alter table sites alter description SET NOT NULL;

# 6.0.0

alter table trucks rename column twitname to twit_name;
alter table trucks rename column weburl to web_url;
alter table trucks rename column lastupdate to last_update;
alter table tweets drop column retweeted;
alter table trucks drop column locs;
alter table trucks drop column tweet;
alter table trucks drop column id;

# 7.0.0

alter table trucks rename column twit_name to id;