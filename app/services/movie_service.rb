# class MovieService
#   def self.discover_movies(search_keyword)
#     if search_keyword == "top_rated"
#       conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
#         faraday.params["api_key"] = ENV['movie_api_key']
#       end
#       response = conn.get("/3/movie/top_rated")
#
#       data = JSON.parse(response.body, symbolize_names: true)
#
#       @movie_titles = data[:results].map do |result|
#         result[:title]
#       end
#
#       @movie_vote_average = data[:results].map do |result|
#         result[:vote_average]
#       end
#     elsif search_keyword != nil
#       conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
#         faraday.params["api_key"] = ENV['movie_api_key']
#       end
#
#       response = conn.get("/3/search/movie?query=#{search_keyword}")
#
#       data = JSON.parse(response.body, symbolize_names: true)
#
#       @movie_titles = data[:results].map do |result|
#         result[:title]
#       end
#
#       @movie_vote_average = data[:results].map do |result|
#         result[:vote_average]
#       end
#     end
#   end
#
# end
