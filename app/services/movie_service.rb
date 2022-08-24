class MovieService
  def top_rated_movies
    # 20 Movies to a page, will need two pages
    response = conn.get("movie/top_rated?&page=1")
    response2 = conn.get("movie/top_rated?&page=2")
    page1 = JSON.parse(response.body, symbolize_names: true)
    page2 = JSON.parse(response2.body, symbolize_names: true)
    output = page1[:results] + page2[:results]
  end


  def conn
    connection = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end
end