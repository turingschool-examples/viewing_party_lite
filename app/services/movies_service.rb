
class MoviesService

  def self.top_rated_movies
    end_point = '/3/movie/top_rated'
    response = connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['movies_db_api_key']
      faraday.params['language'] = 'en-US'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movies_keyword(keyword)
    end_point = '/3/search/movie'
    response_1 = connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['movies_db_api_key']
      faraday.params['query'] = keyword
    end

    response_2 = connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['movies_db_api_key']
      faraday.params['query'] = keyword
      faraday.params['page'] = 2
    end
    json_1 = JSON.parse(response_1.body, symbolize_names: true)
    json_2 = JSON.parse(response_2.body, symbolize_names: true)
    [json_1, json_2]
  end

  def self.connection
    url = 'https://api.themoviedb.org'
    Faraday.new(url: url)
  end
end
