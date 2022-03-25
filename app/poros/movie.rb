class Movie
  attr_reader :id, :title, :vote_average, :runtime, :summary

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @summary = data[:overview]
    @genre = data[:genre_ids]
  end
end
