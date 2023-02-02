class Movie
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :id,
              :cast,
              :reviews

  def initialize(data, cast_data = nil, review_data = nil)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    @id = data[:id]
    @cast = cast_data
    @reviews = review_data
  end
end
