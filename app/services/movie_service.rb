class MovieService

  def self.searched_movies(query)
    search_response = conn.get("/3/search/movie?&query=#{query}")
    movie_results = JSON.parse(search_response.body, symbolize_names: true)
  end

  def self.top_rated_movies
    top_rated_response_page_1 = conn.get("/3/movie/top_rated")
    top_rated_movies_page_1 = JSON.parse(top_rated_response_page_1.body, symbolize_names: true)

    top_rated_response_page_2 = conn.get("/3/movie/top_rated?&page=2")
    top_rated_movies_page_2 = JSON.parse(top_rated_response_page_2.body, symbolize_names: true)

    @top_40_movies = top_rated_movies_page_1[:results].push(top_rated_movies_page_2[:results]).flatten
  end

  def self.conn
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params[:api_key] = ENV['movies_api_key']
    end
  end
end
