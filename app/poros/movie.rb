class Movie
  attr_reader :id, :title, :vote_average, :image, :runtime, :genres, :summary

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @image = data[:poster_path]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
  end
end
