# TVListings

Parses the XMLTV and puts into a MySQL db

![TEE-VEE](http://f.cl.ly/items/3d0M1Z113y2L2A2r293U/Old-School-TV-television-296019_1544_1500.jpg "TEE-VEE")

## Description

This is mainly a legacy project. Back in 2002 I got Sky in but found their planner to be pretty much useless. It never told me when things were on and I don't even think they had a series link back then. So instead of trawling through the radio times and the like I decided to write my own. I used the data provided by the XMLTV.org people and parse the information on a semily regular basis. This way I could then do what I wanted with the data.

I created various things with it - an email reminder to email me of when my shows would be on or coming up. A watchlist so I could keep an eye when a certain star was going to appear on tv as a guest or a recurring character. I then extended it to take episode information - with the grand idea that I could use something to say "show me all the episodes from the X-Files that include the cigaratte smoking man". I was partially successful. However as it was a one man band project I couldn't keep up with the advent of sky+, tivo and other sites.

I gave it a major re-write in 2005 and used XML::Twig. It still uses Class::DBI for its db interface (MySQL) - it should be re-written to use DBIx::Class as it is still supported. it still works. I don't really have a use case for it now as I either use 'On Demand' or 'Sky+' now to catch what I want to watch. So every three days a cron runs to collect the information and put it into a database. At the time of writing I have every tv listings/star information from the start of 2011 until now (May 2012). It might come in useful some time.

## Cron

	MAILTO=whoever@wherever.tld
	30 4 * * 0,2,4 sh /usr/local/bin/tv_update >> /tmp/error.log 

## Disclaimer

This is just for personal use. This is not a commerical site. 

