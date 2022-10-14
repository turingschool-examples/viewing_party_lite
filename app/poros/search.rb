# frozen_string_literal: true

class Search
  attr_reader :name,
              :id,
              :vote_average

  def initialize(movie_hash)
    @name = movie_hash[:title]
    @id = movie_hash[:id]
    @vote_average = movie_hash[:vote_average]
  end
end
