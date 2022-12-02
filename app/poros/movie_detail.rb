class MovieDetail
  attr_reader :title,
              :vote_average,
              :overview,
              :runtime,
              :genres

  def initialize(attributes)
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @overview = attributes[:overview]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
  end
end