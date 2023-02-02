# class MovieService

#   def api_call
#     Faraday.new(url: "https://api.themoviedb.org") do |faraday|
#       faraday.params["api_key"] = ENV["movie_api_key"]
#     end
#   end

#   def top_rated_movies
#     response = api_call.get("/3/movie/top_rated?language=en-US&limit=20")
#     JSON.parse(response.body, symbolize_names: true)
#   end
# end