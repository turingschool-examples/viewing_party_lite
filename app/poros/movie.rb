# frozen_string_literal: true

class Movie
  attr_reader :id, :title, :vote_average, :runtime

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
  end
end
