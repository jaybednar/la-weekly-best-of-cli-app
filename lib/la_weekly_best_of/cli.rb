class LaWeeklyBestOf::CLI 

	def call 

		LaWeeklyBestOf::Scraper.scrape_neighborhood_page 

		# puts %{Please choose an option: 
		# 		'1' to view by Neighborhood
		# 			Choose a neighborhood:
		# 			Lists all neighborhoods under Region 
		# 		'2' to view by Category
		# 			Choose a Category:
		# 			Lists all Categories 
		# 		'3' To view all 'Best Of' Winners 
		# 			Choose One of the Winners: 
		# 			Lists all Winners }

	end 






end 