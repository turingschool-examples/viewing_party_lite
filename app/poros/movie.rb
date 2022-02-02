class Movie
  attr_reader :title,
              :id,
              :vote_average,
              :genres,
              :poster_path,
              :runtime,
              :overview

  def initialize(data)
    @title = data[:title]
    @id = data[:id]
    @vote_average = data[:vote_average]
    @genres = data[:genres]
    @poster_path = data[:poster_path]
    @runtime = data[:runtime]
    @overview = data[:overview]
  end
end
