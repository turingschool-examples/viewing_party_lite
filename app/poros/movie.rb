class Movie 
  attr_reader :title, 
              :vote_average, 
              :id, 
              :genres, 
              :runtime,
              :overview,
              :cast 
              
  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @genres = data[:genres]
    @runtime = data[:runtime]
    @overview = data[:overview]
    @cast = data[:credits][:cast] if data[:credits] 
  end
end