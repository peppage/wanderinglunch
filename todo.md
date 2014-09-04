- update to express 4
- move from PG to Knex
- create login system
- reorganize file structure
- possible move getTrucks from python to javascript?
- redo how clean up tweets is happening, move to DB
- New method for finding multiple trucks in same tweet (waffle)
    - Frack, this isn't thought out yet.
- create new table of intersections and find that in cleaned up tweet
    - tweet format
    - coordinates
    - website display format
- new column in trucks that matches up with id in intersections
- admin area
    - if no match is found from table show possible matches and let the user add them to the DB
    - also allow for additional cleanup additions

== OLD ==
- Voting to confirm location
- manual update page
- error log page, keep track of bad information
- set your location and have it alert you when trucks are close by
	- detect location from phone
- get foursquare checked in data
    - if people are checking in today?
- each truck has a logo
- logged in area
	- that would be another section "my trucks"
	- and you can suppress the ones you hate from the list
	- have it pull in your 4square data and tips so you can remember if you liked it
- filter
	- type in location to narrow it down
- stats
    - trucks updated per day
    - trucks reporting for that section
- Search engine optimized
- paragraph at top to describe site more (one line)
- email alerts when food trucks are in the area
- twitter
    - wanderinglunchnyc
- Put 4sq logo on front page to say that info is being pulled in from 4sq

https://dev.twitter.com/docs/image-resources

possible regex replacement

( |^|\n|w|@)(([0-9]{1,3}(nd|th|rd|ave|st)? |adams|amsterdam|atlantic|beckman|bedford|bergen|bleec?ker|bridge|broad|broadwa?y|b'way|bdway|bway|bdwy|(north|n.?) brunswick|canal|charlton|columbus|court|ditmars|fletcher|front|fulton|gouverneur|goveneur|grand|greene|hanover|(w.? )?houston|hudson|jay|john|kings?|lex|lexington|liberty|lincoln|maiden|mad[^a-z]|madison|madosin|main|mercer|murray hill|(north|n.?) ?end|ocean|old slip|park[^a-z]|pearl|pine|prince|radison|south end|spring|starrett?.?lehigh|vanderbilt|var?ndam|varicks?|vess?ey|wall|washington|water|waverly|whitehall|william|york)([^-]*?)( |$|\n|)){2,3}