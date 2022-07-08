# frozen_string_literal: true

class Movie
  attr_reader :id, :title, :vote_average, :runtime, :runtime_mins, :genres, :overview, :reviews, :cast

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = convert_runtime(attributes[:runtime])
    @runtime_mins = attributes[:runtime]
    @genres = attributes[:genres]
    @overview = attributes[:overview]
    @reviews = get_reviews(attributes)
    @cast = get_cast(attributes)
  end

  def get_reviews(attributes)
    reviews = attributes[:reviews] ? attributes[:reviews][:results] : nil
  end

  def get_cast(attributes)
    cast = attributes[:credits] ? attributes[:credits][:cast] : nil
  end

  def convert_runtime(runtime_mins)
    if runtime_mins
      runtime_hours = runtime_mins / 60
      runtime_mins = runtime_mins % 60
      "#{runtime_hours}hr #{runtime_mins} min"
    end
  end
end
