class MovieService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movies_api_key']
    end
  end

  def self.top_rated_movies
    # conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
    #   faraday.params['api_key'] = ENV['movies_api_key']
    # end
    response = conn.get('/3/movie/top_rated')
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results]
  end

  def self.movie_search(keyword)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params[:query] = keyword
    end
    response = conn.get("/3/search/movie?api_key=#{ENV['movies_api_key']}")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results]
  end

  def self.search_by_movie_id(id)
    response = conn.get("/3/movie/#{id}?api_key=#{ENV['movies_api_key']}")
    data = JSON.parse(response.body, symbolize_names: true)
  end
<<<<<<< HEAD

  def self.search_movie_reviews(id)
    response = conn.get("/3/movie/#{id}/reviews?api_key=#{ENV['movies_api_key']}")
    data = JSON.parse(response.body, symbolize_names: true)
  end 
end
=======
>>>>>>> 9c38276f15edab588a6fa27392d4c63f4383aa87

  def self.cast(id)
    response = conn.get("/3/movie/#{id}/credits?api_key=#{ENV['movies_api_key']}")
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
