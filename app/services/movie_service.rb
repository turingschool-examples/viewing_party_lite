require 'faraday'

  def get_movies
    response = Faraday.new("https://api.themoviedb.org/3/movie/top_rated?api_key=5b03ee47af6e087159e9baca0f110161&language=en-US&page=1")
    require 'pry'; binding.pry
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.propublica.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV["PROPUBLICA_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
  end


get_movies