class MoviesService < BaseService
  
  def self.top_rated_movies
    end_point = '/3/movie/top_rated'
    response = movie_connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['movies_db_api_key']
      faraday.params['language'] = 'en-US'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movies_keyword(keyword)
    end_point = '/3/search/movie'
    response_1 = movie_connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['movies_db_api_key']
      faraday.params['query'] = keyword
    end

    response_2 = movie_connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['movies_db_api_key']
      faraday.params['query'] = keyword
      faraday.params['page'] = 2
    end
    json_1 = JSON.parse(response_1.body, symbolize_names: true)
    json_2 = JSON.parse(response_2.body, symbolize_names: true)
    [json_1, json_2]
  end

  def self.get_movie_cast(movie_id)
    end_point = "/3/movie/#{movie_id}/credits"
    response = movie_connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['movies_db_api_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie_details(movie_id)
    end_point = "/3/movie/#{movie_id}"
    response = movie_connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['movies_db_api_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie_reviews(movie_id)
    end_point = "/3/movie/#{movie_id}/reviews"
    response = movie_connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['movies_db_api_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
