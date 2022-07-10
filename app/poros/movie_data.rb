# frozen_string_literal: true

class MovieData
  attr_reader :name,
              :avg,
              :runtime,
              :genres,
              :summary,
              :cast,
              :reviews

  def initialize(movie_data)
    @name = movie_data[:title]
    @avg = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @genres = movie_data[:genres]
    @summary = movie_data[:overview]
    @cast = movie_data[:credits]
    @reviews = movie_data[:reviews]
  end
end
