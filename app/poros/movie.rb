class Movie
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :id,
              :cast,
              :reviews,
              :poster_path

  def initialize(data, cast_data = nil, review_data = nil)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    @id = data[:id]
    @cast = cast_data
    @reviews = review_data
    @poster_path = data[:poster_path]
  end
end
