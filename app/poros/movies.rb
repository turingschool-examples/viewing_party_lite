# frozen_string_literal: true

class Movies
  attr_reader :id,
              :title,
              :vote_average,
              :genre,
              :overview

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @genre = data[:genre_ids] # double check this
    @overview = data[:overview]
  end
end
