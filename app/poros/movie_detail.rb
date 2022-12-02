class MovieDetail
  attr_reader :title,
              :vote_average,
              :overview,
              :runtime,
              :genres, 
              :id

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @overview = attributes[:overview]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
  end
end