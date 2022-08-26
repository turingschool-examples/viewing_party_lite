# frozen_string_literal: true

class MovieDetails
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :overview

  def initialize(attributes)
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @overview = attributes[:overview]
  end

  def genre_list
    @genres.map { |genre| genre[:name] } * ', '
  end

  def formatted_runtime
    "#{runtime / 60} hr #{runtime % 60} min"
  end
end
