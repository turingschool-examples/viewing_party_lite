# frozen_string_literal: true

class Details
  attr_reader :title,
              :summary,
              :vote_average,
              :runtime,
              :genres,
              :poster_path,
              :id

  def initialize(api)
    @id = api[:id]
    @title = api[:original_title]
    @summary = api[:overview]
    @vote_average = api[:vote_average]
    @runtime = api[:runtime]
    @genres = api[:genres]
    @poster_path = api[:poster_path]
  end

  def genres_names_array
    @genres.map do |genre|
      genre[:name]
    end
  end
end
