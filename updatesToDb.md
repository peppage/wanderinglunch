alter table trucks add column site text;
update trucks set site='nyc';
alter table trucks alter column site set NOT NULL;