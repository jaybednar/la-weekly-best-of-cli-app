class Region 	
	attr_accessor :name, :neighborhoods 

	@@all =[] 

	def self.all 
		@@all
	end 

	def initialize(name)
		@name = name 
		@neighborhoods = [] 
		@@all << self 
	end 


	def winners 
		self.winners
	end 

	def self.create_from_neighborhoods(neighborhoods_array)
		neighborhoods_array = Scraper.scrape_best_of 
		neighborhoods_array.each do |neighborhood|
			self.create_by_neighborhood(neighborhood)  
		end 
	end 

	def self.create_by_neighborhood(neighborhood)
		region = self.new(neighborhood[:region]) 
		region.neighborhoods << neighborhood 

	end 

	def self.find_by_neighborhood

	end 

end 