class LaWeeklyBestOf::Winner 
	attr_accessor :category, :sub_category, :name, :address, :description, :description_author, :neighborhood

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

	def self.create_from_collection(neighborhoods_array)
		# neighborhoods_array = Scraper.scrape_neighborhood_page
		neighborhoods_array.each do |neighborhood|
			LaWeeklyBestOf::Winner.new(neighborhood)
		end 
	end 

	def self.find_by_name(name)
		self.all.detect do |winner_hash|
			winner_hash.name == name 
		end 
	end 
end 