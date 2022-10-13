# frozen_string_literal: true
class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :overview,
              :runtime,
              :genres,
              :image

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @overview = data[:overview]
    @runtime = data[:runtime]
    @genres = data[:genres].map { |genre| genre[:name] }# double check this
    @image = data[:poster_path] #image jpg path
  end
end
