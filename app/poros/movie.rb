# frozen_string_literal: true

class Movie
  attr_reader :id, :title, :vote_average, :overview, :genres, :minutes, :poster_path

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @overview = attributes[:overview]
    @minutes = attributes[:runtime]
    @genres = attributes[:genres]
    @poster_path = attributes[:poster_path]
  end

  def runtime
    hours = @minutes / 60
    rest = @minutes % 60
    "#{hours}hr #{rest}min"
  end
end
