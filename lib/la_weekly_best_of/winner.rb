class LaWeeklyBestOf::Winner 
	attr_accessor :name, :neighborhood, :category, :url, :address, :phone, :description 

	@@all = [] 

	def self.all 
		@@all 
	end 

	def initialize(name, category, location)
		@name = name 
		self.category = category 
		self.neighborhood = neighborhood

	end 

end 