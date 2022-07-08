class Movie
  attr_reader :name,
              :avg,
              :id

  def initialize(movie_data)
    @name = movie_data[:title]
    @avg = movie_data[:vote_average]
    @id = movie_data[:id]
  end

end
