class Movie 
  attr_reader :id,
              :title, 
              :vote_average, 
              :runtime, 
              :genres, 
              :overview,
              :poster_path
              # :cast, 
              # :reviews
  def initialize(attributes)
    @id           = attributes[:id]
    @title        = attributes[:title]
    @vote_average = attributes[:vote_average]
    @overview     = attributes[:overview]
    @poster_path  = attributes[:poster_path]
    @genres       = attributes[:genres]
    @runtime      = attributes[:runtime]
    # @cast 
    # @reviews
  end
end