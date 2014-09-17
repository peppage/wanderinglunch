- update to express 4
- reorganize file structure
- possible move getTrucks from python to javascript?
- create new table of intersections and find that in cleaned up tweet
    - tweet format
    - coordinates
    - website display format
- admin area
    - if no match is found from table show possible matches and let the user add them to the DB
    - delete trucks
    - edit locations
    - add images
    - delete images
    - fixing area (view tweets + update locations)
- convert to jeet?
- have a parent truck
- The user override feature that clears nightly
- Stats => to news or blog
- stats.py is broken

THE LIST
<strike>1 Determine what SQL I did to get mutli trucks working, save it</strike>
<strike>2 Add Coordinates to locations</strike>
<strike>3 Add District to locations</strike>
<stirke>4 Add street to locations (NOPE, sort by lat</strike>
5 Clean up trucks table, remove stuff
<strike>5.5 Convert website to use new data</strike>
<strike>6 /signup returns a 200, NO SIGNUPS</strike>
<strike>7 Verify that the script is in working order (8 hours back in)</strike>
8 Finish Admin area
  - Fix the menu
  - Make it look a lot nicer

== Truck Lists ==
http://www.foodtruckmaps.com/nyc/food_trucks_in_brooklyn_navy_yard/
https://twitter.com/mikespin/lists/street-food-nyc/members
https://twitter.com/nycfoodtruck/lists/nycfta-members/members

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
