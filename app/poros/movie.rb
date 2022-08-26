# frozen_string_literal: true

class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :summary,
              :vote_count,
              :genres,
              :runtime

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @summary = data[:overview]
    @vote_count = data[:vote_count]
    @genres = data[:genres]
    @runtime = data[:runtime]
  end

  def genre_name
    genre = @genres.flat_map {|g| g[:name]}
  end
end
