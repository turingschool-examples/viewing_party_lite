class MovieService
  def self.posters_en_us(movies)
    movie_ids = movies.map { |movie| movie.movie_id }

    responses = movie_ids.map do |movie_id|
      conn.get("/3/movie/#{movie_id}/images")
    end

    jsons = responses.map do |response|
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.params["api_key"] = ENV['da_key']
      f.params['language'] = 'en'
      f.adapter Faraday.default_adapter
    end
  end
end