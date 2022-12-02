# frozen_string_literal: true

class Movie
  attr_reader :id, :title, :runtime, :vote_average, :poster_path

  def initialize(result)
    @id = result[:id]
    @title = result[:title]
    @runtime = result[:runtime]
    @vote_average = result[:vote_average]
    @poster_path = result[:poster_path]
  end
end
