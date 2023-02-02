class MovieFacade
  def self.top_rated_movies
    json = MovieService.top_rated_movies[:results]
    json.map do |data|
      Movie.new(data)
    end
  end

  def self.keyword_search(keyword)
    json = MovieService.keyword_search(keyword)[:results]
    json.map do |data|
      Movie.new(data)
    end
  end
end