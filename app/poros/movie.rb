# frozen_string_literal: true

class Movie
  attr_reader :title, :vote_average, :id, :duration, :movie_image, :genres, :overview, :cast, :release_date, :reviews

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @duration = data[:runtime]
    @movie_image = data[:poster_path]
    @vote_average = data[:vote_average]
    @genres = data[:genres]
    @overview = data[:overview]
    @cast = data[:cast]
    @release_date = data[:release_date]
    @reviews = data[:results]
  end
end
