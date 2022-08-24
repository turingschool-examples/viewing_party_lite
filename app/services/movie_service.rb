# class MovieService 
#   def top_rated
#     conn = Faraday.new("https://api.themoviedb.org")
#     response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
#     JSON.parse(response.body, symbolize_names :true)
#   end
  
#   def self.api_key 
#     require 'pry'; binding.pry 
#     ENV['movie_api_key']
#   end
# end