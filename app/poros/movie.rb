class Movie
  attr_reader :id, :title, :vote_average, :runtime,
  :genres, :description, :total_reviews

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @description = data[:overview]
    @total_reviews = data[:vote_count]
  end
end
