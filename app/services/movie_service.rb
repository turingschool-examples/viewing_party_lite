class MovieService

  def self.all_movie_id_search(id)
    end_point = "/3/movie/#{id}"
    response = connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['moviedb_api_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie_cast(id)
    end_point = "/3/movie/#{id}/credits"
    response_2 = connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['moviedb_api_key']
    end
    JSON.parse(response_2.body, symbolize_names: true)
  end

  def self.get_reviews(id)
    end_point = "/3/movie/#{id}/reviews"
    response_3 = connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['moviedb_api_key']
    end
    JSON.parse(response_3.body, symbolize_names: true)
  end

  def self.find_top_rated
    response_4 = connection.get('/3/movie/top_rated') do |f|
      f.params['api_key'] = ENV['moviedb_api_key']
    end
    JSON.parse(response_4.body, symbolize_names: true)
  end

  def self.search_films(search_param)
    response_5 = connection.get("/3/search/movie?query=#{search_param}") do |f|
      f.params['api_key'] = ENV['moviedb_api_key']
    end
    JSON.parse(response_5.body, symbolize_names: true)
  end
  
  def self.connection
    url = 'https://api.themoviedb.org'
    Faraday.new(url: url)
  end
end

