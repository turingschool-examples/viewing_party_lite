class Movie 
  attr_reader :title, 
              :vote_average, 
              :id, 
              :genres, 
              :runtime,
              :overview, 
              :reviews,
              :poster_path
              
              
  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @genres = data[:genres]
    @runtime = data[:runtime]
    @overview = data[:overview]
    @reviews = data[:reviews]
    @poster_path = "https://image.tmdb.org/t/p/w200#{data[:poster_path]}"
  end
end