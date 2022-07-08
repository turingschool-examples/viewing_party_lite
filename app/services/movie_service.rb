# frozen_string_literal: true

class MovieService
  def self.top_rated_movies(page_num)
    response = connection.get("/3/movie/top_rated?page=#{page_num}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.search(keyword, page_num)
    response = connection.get("/3/search/movie?query=#{keyword}&page=#{page_num}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_details(id)
    response = connection.get("/3/movie/#{id}?append_to_response=reviews,credits")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.connection
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['tmdb_api_key']
    end
  end
end
