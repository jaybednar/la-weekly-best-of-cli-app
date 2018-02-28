class LaWeeklyBestOf::Scraper 
	attr_accessor :url


	def create_neighborhood
		doc = Nokogiri::HTML(open("http://www.laweekly.com/best-of"))

		neighborhoods = []

		neighborhood_list = doc.search("div#neighborhoodImages ul li")
		
		neighborhood_list.each do |neighborhood_li|
			n_hash = Hash.new 
			n_hash[:name] = neighborhood_li.search("a").text
			n_hash[:url] = neighborhood_li.search("a").attr("href").value
			if (n_hash[:name].include?("Chinatown/Elysian Park") || n_hash[:name].include?("Downtown")) 
				n_hash[:region] = "Central"
			elsif (n_hash[:name].include?("Silver Lake") || n_hash[:name].include?("Echo Park")) 
				n_hash[:region] = "Northeast"
			end 
			neighborhoods << n_hash
		end 
		neighborhoods
	end 	
end 