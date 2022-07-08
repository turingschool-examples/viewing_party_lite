class MovieService


  def top_40_rated_movies
  
    response_1 = conn.get("/3/movie/top_rated?page=1")
    response_2 = conn.get("/3/movie/top_rated?page=2")

    data_1 = JSON.parse(response_1.body, symbolize_names: true)
    data_2 = JSON.parse(response_2.body, symbolize_names: true)
    combo_data = data_1[:results] + data_2[:results]
  end

  def movie_search(query)
    response = conn.get("/3/search/movie?&language=en-US&query=#{query}&page=1")

    data = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do | faraday |
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end
end