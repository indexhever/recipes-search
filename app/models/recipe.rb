class Recipe
	include HTTParty

	base_uri 'http://food2fork.com/api/search'
	#default_params key: ENV["FOOD2FORK_KEY"]
	default_params key: "0fdaa56c3e245939e57ec30d27a2ed37"
	format :json

	def self.for term
		get("", query: {q: term})["recipes"]
	end
end