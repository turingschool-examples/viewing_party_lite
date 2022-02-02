class Movie 
  attr_reader :id, 
              :title, 
              :overview, 
              :vote_average,
              :vote_count,
              :poster_path


  def initialize(data)
    @id           = data[:id]
    @title        = data[:title]
    @summary      = data[:overview]
    @vote_average = data[:vote_average]
    @vote_count   = data[:vote_count]
    @poster_path  = data[:poster_path]
    # @length     =
    # @cast         = []
    # @genre      =
  end
end