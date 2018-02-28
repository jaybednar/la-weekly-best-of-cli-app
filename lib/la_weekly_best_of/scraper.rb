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
		
		
	end 

	def self.scrape_neighborhood_page(neighborhood_url)
		#return a new hash for each winner which i will use to instantiate each winner 
		#category = doc.search("div.bestof span.ca a").first.text
		#sub_category = doc.search("section.award").first.attr("data-soctitle").value.split(":").first
		#name (name of business) = doc.search("section.award").first.attr("data-soctitle").value.split(":").last
		#address = doc.search("div.address").first.text.strip.split("\n").first
		#phone (if has one) = doc.search("div.phone").first.text
		#url (if there is one)  =  doc.search("div.url a")[1].attr("href")
		#description = doc.search("div.description p").first.text
		#description author = doc.search("div.byline a").first.text

		
		self.scrape_best_of.each do |neighborhood|
			puts neighborhood[:url]
		end 

		doc = Nokogiri::HTML(open("http://www.laweekly.com/best-of/2017/neighborhoods?n[]=San%20Fernando%20Valley"))
		
	end 
end 