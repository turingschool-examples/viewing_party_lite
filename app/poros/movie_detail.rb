class MovieDetail
  attr_reader :title,
              :vote_average,
              :overview,
              :runtime,
              :genres, 
              :id, 
              :image

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @overview = attributes[:overview]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @image = 'https://image.tmdb.org/t/p/w500' + (attributes[:poster_path]).to_s
  end
end