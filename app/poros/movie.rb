# frozen_string_literal: true

class Movie
  attr_reader :id, :title, :runtime, :vote_average, :genres, :summary, :poster

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @runtime = attributes[:runtime]
    @vote_average = attributes[:vote_average]
    @genres = attributes[:genres]
    @summary = attributes[:overview]
    @poster = attributes[:poster_path]
  end
end
