class Movie
  attr_reader :movie_id, :title, :vote_average, :runtime, :genres, :summary

  def initialize(data)
    @movie_id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres].map { |genre| genre[:name] }
    @summary = data[:overview]
  end
end