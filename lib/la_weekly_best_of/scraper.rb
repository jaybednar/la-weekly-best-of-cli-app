class LaWeeklyBestOf::Scraper 
	attr_accessor :url


	def self.scrape_best_of
		#scrapes la weekly and returns an array of hashes containing the overall neighborhood info 

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
		# binding.pry
		
	end 

	def self.scrape_neighborhood_page
		#return an array of hashes for each winner which i will use to instantiate each winner 
		winners_by_neighborhood = [] 

		self.scrape_best_of.each do |neighborhood| 
			
			doc = Nokogiri::HTML(open(neighborhood[:url])).search("section.award")
			
			doc.each do |winner| 
				winner_hash = Hash.new 
				winner_hash[:category] = winner.search("span.ca a").text
				winner_hash[:sub_category] = winner.attr("data-soctitle").split(":").first.strip
				winner_hash[:name] = winner.attr("data-soctitle").split(":").last.strip
				winner_hash[:address] = winner.search("div.address").text.strip.split("\n").first
				winner_hash[:description] = winner.search("div.description p").text.strip
				winner_hash[:description_author] = winner.css("div.byline a").text.strip
				winner_hash[:neighborhood] = neighborhood[:name]
				winners_by_neighborhood << winner_hash
			end 
		end 
		winners_by_neighborhood
	end 



end 