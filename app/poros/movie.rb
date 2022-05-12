class Movie
  attr_reader :id, :title, :vote_average, :runtime, :genres, :overview, :vote_count
  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @overview = data[:overview]
    @vote_count = data[:vote_count]
  end
end
