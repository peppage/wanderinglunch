alter table images alter visibility set default 'public';
alter table images alter menu set default 'f';
update images set menu='f' where menu IS NULL;

drop table messages;
create table message (id serial, message text NOT NULL);

alter table locations add column site text;
update locations set site='nyc';
alter table locations alter column site set NOT NULL;

alter table locations add column zone text;
update locations set zone='Brooklyn' where hood='Brooklyn';
update locations set zone='Manhatten' where zone IS NULL;
alter table locations alter column zone set NOT NULL;

// might need to update trucks with their "site" (nyc, buffalo, jC)