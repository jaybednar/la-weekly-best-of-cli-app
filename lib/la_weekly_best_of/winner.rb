class LaWeeklyBestOf::Winner 
	attr_accessor :name, :neighborhood, :category, :url, :address, :phone, :description 

	@@all = [] 

	def self.all 
		@@all 
	end 

	def initialize(winner_hash)
		winner_hash.each do |attribute, value|
			self.send("#{attribute}=", value)
		end 
		@@all << self 
	end 

	def create_from_collection(neighborhoods_array)
		neighborhoods_array = Scraper.scrape_neighborhood_page 
		neighborhoods_array.each do |neighborhood|
			LaWeeklyBestOf::Winner.new(neighborhood)
		end 
	end 

end 