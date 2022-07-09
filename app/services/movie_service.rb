class MovieService
  def self.all_movie_id_search(id)
    end_point = "/3/movie/#{id}"
    response = movie_connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['moviedb_api']
    end
    x = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
  end

  def self.movie_connection
      url = 'https://api.themoviedb.org'
      Faraday.new(url: url)
  end
end
