class MovieService
  def self.all_movie_id_search(id)
    end_point = "/3/movie/#{id}"
    response = connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['moviedb_api']
    end
    x = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
  end

  def self.get_movie_cast(id)
    end_point = "/3/movie/#{id}/credits"
    response_2 = connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['moviedb_api']
    end
    JSON.parse(response_2.body, symbolize_names: true)
  end

  def self.get_reviews(id)
    end_point = "/3/movie/#{id}/reviews"
    response_3 = connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['moviedb_api']
    end
    JSON.parse(response_3.body, symbolize_names: true)
  end

  def self.connection
      url = 'https://api.themoviedb.org'
      Faraday.new(url: url)
  end
end
