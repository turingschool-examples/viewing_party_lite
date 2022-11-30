class MovieService
  def self.posters_en_us(movie)
    movie_id = movie.movie_id
    response = conn.get("/3/movie/#{movie_id}/images")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.params["api_key"] = ENV['da_key']
      f.params['language'] = 'en'
      f.adapter Faraday.default_adapter
    end
  end
end