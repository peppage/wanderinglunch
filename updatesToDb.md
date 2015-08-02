alter table images alter visibility set default 'public';
alter table images alter menu set default 'f';
update table set menu='f' where menu IS NULL;

drop table messages;
create table message (id serial, message text NOT NULL);

alter table locations add column site text NOT NULL;
update locations set site='nyc';

alter table locations add column zone text NOT NULL;
update locations set zone='Brooklyn' where hood='Brooklyn';
update locations set zone='Manhatten' where zone IS NULL;

// might need to update trucks with their "site" (nyc, buffalo, jC)