# frozen_string_literal: true

class Movie
  attr_reader :title, :vote_average, :duration

  def initialize(movie_data)
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @duration = movie_data[:duration]
  end
end
