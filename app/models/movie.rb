class Movie
  attr_reader :title,
              :id,
              :vote_average

  def initialize(movie)
    @title = movie[:title]
    @id = movie[:id]
    @vote_average = movie[:vote_average]
  end
end
