class MovieService

  def self.search_movie(keyword)
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end

    response1 = conn.get("/3/search/movie?query=#{keyword}")
    response2 = conn.get("/3/search/movie?page=2&query=#{keyword}")
    
    data1 = JSON.parse(response1.body, symbolize_names: true)
    data2 = JSON.parse(response2.body, symbolize_names: true)
    
    data1[:results] + data2[:results]
  end

  def self.top_rated_movies
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end

    response1 = conn.get("/3/movie/top_rated")
    response2 = conn.get("/3/movie/top_rated?page=2")
    
    data1 = JSON.parse(response1.body, symbolize_names: true)
    data2 = JSON.parse(response2.body, symbolize_names: true)
    
    data1[:results] + data2[:results]
  end

  def self.movie_details(id)

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end

    response = conn.get("/3/movie/#{id}")
    cast_response = conn.get("/3/movie/#{id}/credits")
    review_response = conn.get("/3/movie/#{id}/reviews")
    
    data = JSON.parse(response.body, symbolize_names: true)
    cast_data = JSON.parse(cast_response.body, symbolize_names: true)
    review_data = JSON.parse(review_response.body, symbolize_names: true)

    data[:cast] = cast_data[:cast].first(10)
    data[:review_count] = review_data[:total_results]
    data[:review_content] = review_data[:results]
    data
  end
end