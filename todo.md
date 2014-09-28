- reorganize file structure
- possible move getTrucks from python to javascript?
- create new table of intersections and find that in cleaned up tweet
    - tweet format
    - coordinates
    - website display format
- admin area
    - delete trucks
    - delete images
- convert to jeet?
- have a parent truck
- The user override feature that clears nightly
- Stats => to news or blog
- stats.py is broken
- using https://medium.com/@fat/mediums-css-is-actually-pretty-fucking-good-b8e2a6c78b06 make yo css clearer

THE LIST
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
