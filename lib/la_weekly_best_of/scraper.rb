class LaWeeklyBestOf::Scraper 
	attr_accessor :url


	def self.scrape_neighborhoods
		#scrapes la weekly and returns an array of hashes containing the overal neighborhood info 

		doc = Nokogiri::HTML(open("http://www.laweekly.com/best-of"))

		neighborhoods = []

		neighborhood_list = doc.search("div#neighborhoodImages ul li")
		
		neighborhood_list.each do |neighborhood_li|
			n_hash = Hash.new 
			name = neighborhood_li.search("a").text
			url = neighborhood_li.search("a").attr("href").value
			n_hash[:name] = name 
			n_hash[:url] = url 
			if (name == "Chinatown/Elysian Park" || name == "Downtown" || name == "Fairfax/Beverly/Melrose/Beverly Grove" || name == "Koreatown" || name == "Hollywood/East Hollywood" || name == "Mid-Wilshire/Hancock Park/Larchmont/Miracle Mile" || name == "West Hollywood") 
				n_hash[:region] = "Central"
			elsif (name == "Silver Lake" || name == "Echo Park" || name == "Highland Park/Eagle Rock" || name == "Mount Washington/Glassell Park/Cypress Park" || name == "Los Feliz/Atwater Village")  
				n_hash[:region] = "Northeast"
			elsif (name == "Inglewood" || name == "Long Beach" || name == "South Bay" || name == "South L.A./USC/Compton/Watts" || name == "West Adams/Crenshaw/Baldwin Hills")  
				n_hash[:region] = "South"
			elsif (name == "East L.A./Boyle Heights/Montecito Heights/El Sereno" || name == "Glendale" || name == "San Gabriel Valley: Monterey Park/Alhambra/San Gabriel" || name == "San Gabriel Valley: Pasadena/South Pasadena/Altadena")  
				n_hash[:region] = "East"
			elsif (name == "Culver City/Palms/Mar Vista" || name == "Malibu" || name == "Santa Monica" || name == "Venice/Marina del Rey" || name == "West L.A./Sawtelle/Brentwood")  
				n_hash[:region] = "West"
			else 
				n_hash[:region] = "San Fernando Valley"
			end 
			neighborhoods << n_hash
		end 
		neighborhoods
	end 	
end 