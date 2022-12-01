# frozen_string_literal: true

class MovieService
  def self.get_top_movies
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['api_key'] = ENV['movie_api_key']
    end
    page_1 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=1")
    page_2 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=2")
    page_1_data = JSON.parse(page_1.body, symbolize_names: true)
    page_2_data = JSON.parse(page_2.body, symbolize_names: true)

    response = page_1_data[:results] + page_2_data[:results]
  end

  def self.get_movie(id)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
    movie_details = conn.get("/3/movie/#{id}")
    credits = conn.get("/3/movie/#{id}/credits")
    reviews = conn.get("/3/movie/#{id}/reviews")

    data_1 = JSON.parse(movie_details.body, symbolize_names: true)
    data_2 = JSON.parse(credits.body, symbolize_names: true)
    data_3 = JSON.parse(reviews.body, symbolize_names: true)

    data_4 = data_1.merge(data_2)
    response = data_4.merge(data_3)
  end

  def self.search_movies(search)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['api_key'] = ENV['movie_api_key']
    end
    response = conn.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&page=1&include_adult=false&query=#{search}")
    if response.status == 200
      results = JSON.parse(response.body, symbolize_names: true)
      results[:results]
    end
  end
end
