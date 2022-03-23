# class TopService
#   def self.conn
#     Faraday.new(url: "https://api.themoviedb.org/3?api_key=#{ENV['movie_api_key']}")
#   end
#
#   def self.top_rated
#     response = conn.get("/movie/top_rated")
#
#     json = JSON.parse(response.body, symbolize_names: true)
#   end
# end
