alter table trucks add column site text;
update trucks set site='nyc';
alter table trucks alter column site set NOT NULL;
alter table locations drop column "region"
alter table locations drop column "hood";
alter table locations later column long type float using (long::float);
alter table locations alter column long type float using (long::float);

https://twitter.com/mordisfoodtruck
https://twitter.com/TheIncrediballs
https://twitter.com/mecasajc
https://twitter.com/thegreenradish1
https://twitter.com/theAngryCrabNJ
https://twitter.com/AmandaBananasNJ
https://twitter.com/OSM_NJ
https://twitter.com/choppingblockft
https://twitter.com/Food_Samurai/status/638382524746629120
