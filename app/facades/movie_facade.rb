class MovieFacade
  def self.top_rated
    json = MovieService.top_rated
    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end[0...20]
  end

  def self.search(string)
    json = MovieService.search(string)
    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end[0...20]
  end
end