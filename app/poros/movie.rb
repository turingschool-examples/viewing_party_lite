class Movie
  attr_reader :name,
              :avg
              
  def initialize(movie_data)
    @name = movie_data[:title]
    @avg = movie_data[:vote_average]
  end

end
