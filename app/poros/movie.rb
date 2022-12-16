class Movie
  attr_reader :id,
              :title,
              :image_path,
              :vote_average,
              :duration,
              :summary

  def initialize(attributes)
    @id           = attributes[:id]
    @title        = attributes[:title]
    @image_path   = attributes[:image_path]
    @vote_average = attributes[:vote_average]
    @duration     = attributes[:runtime]
    @summary      = attributes[:overview]
  end
end
