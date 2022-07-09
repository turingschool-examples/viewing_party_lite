# frozen_string_literal: true

class Movie
  attr_reader :title, :vote_average, :runtime, :id, :overview, :author, :review

  def initialize(movie_data)
    @data = movie_data
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @id = movie_data[:id]
    @overview = movie_data[:overview]
    @author = movie_data[:author]
    @review = movie_data[:content]
  end

  def get_genre
    @data[:genres].map do |genre|
      genre[:name]
    end
  end
end
