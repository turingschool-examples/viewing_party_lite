class MovieService


  def self.top_40_rated_movies
    conn = Faraday.new(url: 'https://api.themoviedb.org') do | faraday |
      faraday.params['api_key'] = ENV['movie_api_key']
    end

    response_1 = conn.get("/3/movie/top_rated?page=1")
    response_2 = conn.get("/3/movie/top_rated?page=2")

    data_1 = JSON.parse(response_1.body, symbolize_names: true)
    data_2 = JSON.parse(response_2.body, symbolize_names: true)
    combo_data = data_1[:results] + data_2[:results]
  end
end