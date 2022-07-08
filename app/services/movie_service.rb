# frozen_string_literal: true

class MovieService
  def self.top_20_movies
    response = connection.get("/3/movie/top_rated?api_key=#{ENV['api_key']}")
    # results = (parse_response(movies))[:results]
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results]
  end

  def self.connection
    Faraday.new(url: 'https://api.themoviedb.org')
  end
end

# conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
#   faraday.params["X-API-KEY"] = ENV['api_key']
# end
#
# response = conn.get("/congress/v1/members/house/#{state}/current.json")
#
# json = JSON.parse(response.body, symbolize_names: true)

# response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_db_key']}")
