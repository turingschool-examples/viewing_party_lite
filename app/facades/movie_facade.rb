# frozen_string_literal: true

class MovieFacade

  def self.movie_search(search)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV.fetch('tmdb_api_key', nil)
    end

    response_1 = conn.get("/3/search/movie?query=#{search}")
    response_2 = conn.get("/3/search/movie?page=2&query=#{search}")

    json_1 = JSON.parse(response_1.body, symbolize_names: true)
    json_2 = JSON.parse(response_2.body, symbolize_names: true)

    search_results = json_1[:results] + json_2[:results]

    @movies = search_results.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.top_rated
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV.fetch('tmdb_api_key', nil)
    end

    response_1 = conn.get('/3/movie/top_rated')
    response_2 = conn.get('/3/movie/top_rated?page=2')

    json_1 = JSON.parse(response_1.body, symbolize_names: true)
    json_2 = JSON.parse(response_2.body, symbolize_names: true)

    top_40 = json_1[:results] + json_2[:results]

    @movies = top_40.map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
