class Movie
  attr_reader :id, :movie_title, :vote_average, :runtime, :genres, :summary, :first_10_cast_members

  def initialize(data)
    @id = data[:id]
    @movie_title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    # @first_10_cast_members = MoviesService.cast_members(data[:id]).first(10)
    # @count_total_reviews =
    # @details
  end
end