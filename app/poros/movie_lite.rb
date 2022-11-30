class MovieLite
  attr_reader :id, :movie_title, :vote_average

  def initialize(data)
    @id = data[:id]
    @movie_title = data[:title]
    @vote_average = data[:vote_average]
  end
end