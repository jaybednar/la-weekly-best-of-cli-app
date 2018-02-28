class LaWeeklyBestOf::Category 
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

	def neighborhoods 
		# self.winners.collect{|winner| winner.neighborhood}  
	end 

	def create_from_neighborhood_scrape 

	end 

end 