# frozen_string_literal: true

class Movie
  attr_reader :title, :vote_average, :duration, :id

  def initialize(movie_data)
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @duration = movie_data[:duration]
    @id = movie_data[:id]
  end
end
