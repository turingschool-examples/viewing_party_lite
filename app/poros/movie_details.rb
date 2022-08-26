# frozen_string_literal: true

class MovieDetails
  attr_reader :movie_id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :poster

  def initialize(attributes)
    @movie_id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average].round(1) if attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @overview = attributes[:overview]
    @poster = attributes[:poster_path]
  end

  def genre_list
    genres.map { |genre| genre[:name] } * ', '
  end

  def formatted_runtime
    "#{runtime / 60} hr #{runtime % 60} min"
  end
end
