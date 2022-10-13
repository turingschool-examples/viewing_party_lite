class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :genres,
              :summary,
              :cast, 
              :reviews,
              :image_path

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @genres = attributes[:genres]
    @summary = attributes[:summary]
    @cast = attributes[:cast]
    @reviews = attributes[:reviews]
    @image_path = attributes[:image_path]
  end
end