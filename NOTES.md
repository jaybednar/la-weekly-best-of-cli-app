CLI Gem 

1)	Plan your gem, imagine your interface 
2)	Start with the project structure - google   "how to build a gem"
a.	bundle gem gem_name
3)	Start with the entry point - the file run 
4)	Force that to build the CLI Interface 
5)	Stub out the interface 
6)	Start making things real 
7)	Discover Objects 
8)	Program 

Example:

1)
-	A command line interface for LAWeekly Best of 
o	User types la-weekly-best-of 
"	Asks User:  Please choose an option: 
				'1' to view by Neighborhood
					Choose a neighborhood:
					Lists all neighborhoods under Region 
				'2' to view by Category
					Choose a Category:
					Lists all Categories 
				'3' To view all 'Best Of' Winners 
					Choose One of the Winners: 
					Lists all Winners 

o	What is a Neighborhood? 
"	Has a NAME 
"	Has WINNERS
"	Has CATEGORIES (through winners)

What is a Winner? 
"	Has a NAME 
	Has a LOCATION (address) 
	Has a URL 
	Has a PHONE
	Has a DESCRIPTION
"	Belongs to a NEIGHBORHOOD
"	Belongs to a CATEGORY 

What is a Category? 
"	Has a NAME 
"	Has WINNERS
"	Has NEIGHBORHOODS (through winners)


2) bundle gem gem_name 
             cd gem_name 

3) Entry point
	1) create file in bin     gem-name 
	2) cd bin 
	3) ls -lah 
	4)  chmod +x gem-name

4) Write the code you wish you had 
	1) Set up Object  (ex: DailyDeal::CLI.new.call) in .bin/gem_name 
	2) Start stubbing out CLI Controller 
	3) require_relative for cli.rb and version. 
		(require_relative "./daily_deal/version"
require_relative "./daily_deal/cli")
	4) now, with working bin file (puts out statement in cli controller to check, begin discovering objects (build fake methods, etc in cli controller 


switch to main directory for la-weekly-best-of 
git add README.md
git commit -m "message"
git push -u origin master
