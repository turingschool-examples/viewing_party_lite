class Movie
  attr_reader :id, :movie_title, :poster, :rating, :vote_count

  def initialize(attributes)
    @id = attributes[:id]
    @movie_title = attributes[:title]
    @poster = "https://image.tmdb.org/t/p/w500#{attributes[:poster_path]}"
    @rating = attributes[:vote_average]
    @vote = attributes[:vote_count]
  end
end
