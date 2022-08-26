# frozen_string_literal: true

class MovieService
  def self.movie_search(search)
    response_1 = conn.get("/3/search/movie?query=#{search}")
    response_2 = conn.get("/3/search/movie?page=2&query=#{search}")

    json_1 = parse_data(response_1)
    json_2 = parse_data(response_2)

    search_results = json_1[:results] + json_2[:results]
  end

  def self.top_rated
    response_1 = conn.get('/3/movie/top_rated')
    response_2 = conn.get('/3/movie/top_rated?page=2')

    json_1 = parse_data(response_1)
    json_2 = parse_data(response_2)

    top_40 = json_1[:results] + json_2[:results]
  end

  def self.movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    parse_data(response)
    
  end

  private

  def self.conn
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV.fetch('tmdb_api_key', nil)
    end
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
