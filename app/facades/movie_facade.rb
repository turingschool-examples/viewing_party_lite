class MovieFacade
  def self.top_rated_movies
    json = MovieService.top_rated_movies[:results]
    movies_array(json)
  end

  def self.keyword_search(keyword)
    json = MovieService.keyword_search(keyword)[:results]
    movies_array(json)
  end

  def self.movies_array(json)
    json.map do |data|
      Movie.new(data)
    end
  end

  def self.movie_details(movie_id)
    json = MovieService.detail_search(movie_id)
    Movie.new(json)
  end
end