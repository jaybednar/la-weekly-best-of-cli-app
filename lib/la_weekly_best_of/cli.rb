class CLI 

	def call 

		neighborhoods_array = Scraper.scrape_best_of 
		Region.create_from_neighborhoods(neighborhoods_array)
		binding.pry

		# puts "Please choose a neighborhood:"

		# neighborhoods.each.with_index(1) do |neighborhood_hash, i|

		# 	puts "-------------- CENTRAL LA ---------------"

		# 	if neighborhood_hash[:region] == "Central"
		# 		puts "#{i}. #{neighborhood_hash[:name]}" 
		# 	else
		# 	end 

		# 	puts "-------------- NORTHEAST LA ---------------"
		# 	if neighborhood_hash[:region] == "Northeast"
		# 		puts "#{i}. #{neighborhood_hash[:name]}" 
		# 	else
		# 	end 
		# 	puts "-------------- EAST LA ---------------"
		# 	if neighborhood_hash[:region] == "East"
		# 		puts "#{i}. #{neighborhood_hash[:name]}" 
		# 	else
		# 	end 
		# 	puts "-------------- SOUTH LA ---------------"
		# 	if neighborhood_hash[:region] == "South"
		# 		puts "#{i}. #{neighborhood_hash[:name]}" 
		# 	else
		# 	end 
		# 	puts "-------------- WEST LA ---------------"
		# 	if neighborhood_hash[:region] == "West"
		# 		puts "#{i}. #{neighborhood_hash[:name]}" 
		# 	else
		# 	end 
		# 	puts "-------------- SAN FERNANDO VALLEY ---------------"
		# 	if neighborhood_hash[:region] == "San Fernando Valley"
		# 		puts "#{i}. #{neighborhood_hash[:name]}" 
		# 	else
		# 	end 


		# end 

	end 






end 