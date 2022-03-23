# frozen_string_literal: true

class Movie
  attr_reader :title, :genres, :summary, :vote_average, :duration, :minutes, :poster_path

  def initialize(data)
    @title = data[:title]
    @genres_array = []
    @genres = data[:genres]
    @summary = data[:overview]
    @vote_average = data[:vote_average]
    @duration = time_format(data[:runtime])
    @minutes = data[:runtime]
    @poster_path = data[:poster_path]
  end

  def time_format(minutes)
    hours = minutes / 60
    min = minutes % 60
    "#{hours} hour(s) and #{min} minute(s)"
  end
end
