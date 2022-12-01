class Movie
  attr_reader :id, :movie_title, :poster, :rating

  def initialize(attributes)
    @id = attributes[:id]
    @movie_title = attributes[:title]
    @poster = attributes[:poster_path]
    @rating = attributes[:vote_average]
  end
end
