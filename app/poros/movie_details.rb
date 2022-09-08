# frozen_string_literal: true

class MovieDetails
  attr_reader :movie_id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :poster,
              :reviews

  def initialize(attributes)
    @movie_id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average].round(1) if attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @overview = attributes[:overview]
    @poster = "https://image.tmdb.org/t/p/w200#{attributes[:poster_path]}"
    @credits = attributes[:credits][:cast][0..9] if attributes[:credits]
    @reviews = attributes[:reviews][:results] if attributes[:reviews]
  end

  def genre_list
    @genres.map { |genre| genre[:name] } * ', '
  end

  def formatted_runtime
    "#{runtime / 60} hr #{runtime % 60} min"
  end

  def cast_members
    @credits.map { |credit| "#{credit[:name]} as #{credit[:character]}" }
  end
end
