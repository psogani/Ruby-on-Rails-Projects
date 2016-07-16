class Recipe
	include HTTParty
	ENV['FOOD2FORK_KEY'] = "7ccdd6b2873e7ba67588fe3934afa650"
	#ENV['FOOD2FORK_SERVER_AND_PORT']="80"
	key_value = ENV['FOOD2FORK_KEY']
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api"
	default_params key: key_value
	format:json

	def self.for(search_term)
		get("/search", query: {q: search_term})["recipes"]
	end
end