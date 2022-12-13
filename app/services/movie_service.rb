class MovieService
  def self.conn
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV['movie_api_key']
    end
  end

  def self.search_movies(title)
    query_conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV['movie_api_key']
      faraday.params["query"] = title
    end
    response = query_conn.get("/3/search/movie")

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated
    response = conn.get("/3/movie/top_rated")

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_details(movie_id)
    details_response = conn.get("/3/movie/#{movie_id}")
    credits_response = conn.get("/3/movie/#{movie_id}/credits")
    reviews_response = conn.get("/3/movie/#{movie_id}/reviews")

    details_data = JSON.parse(details_response.body, symbolize_names: true)
    credits_data = JSON.parse(credits_response.body, symbolize_names: true)
    reviews_data = JSON.parse(reviews_response.body, symbolize_names: true)

    data = {details: details_data, credits: credits_data, reviews: reviews_data}
  end
end
