# frozen_string_literal: true

require './app/services/movies_service'

class MovieHeavy
  attr_reader :id,
              :movie_title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :first_10_cast_members,
              :reviews

  def initialize(data)
    @id = data[:id]
    @movie_title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    @first_10_cast_members = CastMembersFacade.cast(data[:id])
    @reviews = ReviewsFacade.reviews(data[:id])
  end
end
