class Neighborhood
	attr_accessor :name, :winners 

	@@all =[] 

	def self.all 
		@@all
	end 

	def initialize(name)
		@name = name 
		@winners = [] 
		@@all << self 
	end 

	def winners 
		self.winners
	end 

	def categories 
		# self.winners.collect{|winner| winner.category}  
	end 

	def create_from_scrape(neighborhoods_array)
		#accepts an array of hashes, each hash being the attributes of a neighborhood to create a new instance 
	end 


end 