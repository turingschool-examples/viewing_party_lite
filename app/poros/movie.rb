# frozen_string_literal: true

class Movie
  attr_reader :id, :title, :vote_average, :runtime, :genres, :overview, :reviews, :cast

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = convert_runtime(attributes[:runtime])
    @genres = attributes[:genres]
    @overview = attributes[:overview]
    @reviews = get_reviews(attributes)
    @cast = get_cast(attributes)
  end

  def get_reviews(attributes)
    attributes[:reviews] ? reviews = attributes[:reviews][:results] : reviews = nil
  end

  def get_cast(attributes)
    attributes[:credits] ? cast = attributes[:credits][:cast] : cast = nil 
  end

  def convert_runtime(runtime_mins)
    if runtime_mins
      runtime_hours = runtime_mins / 60
      runtime_mins = runtime_mins % 60
      "#{runtime_hours}hr #{runtime_mins} min"
    end
  end

end
