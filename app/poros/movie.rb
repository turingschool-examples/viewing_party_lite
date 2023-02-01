class Movie
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :id

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    @id = data[:id]
  end
end
