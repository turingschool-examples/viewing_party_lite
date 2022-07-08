class Movie
  attr_reader :title,
              :vote_average,
              :id,
              :image_path,
              :duration,
              :genre,
              :overview

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @id = data[:id]
    @image_path = data[:poster_path]
    @duration = data[:runtime]
    @genre = data[:genres]
    @overview = data[:overview]
  end
end
