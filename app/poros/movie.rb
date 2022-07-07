# frozen_string_literal: true

class Movie
  attr_reader :id, :title, :vote_average, :runtime, :reviews, :cast

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    attributes[:reviews] ? @reviews = attributes[:reviews][:results] : @reviews = nil
    attributes[:credits] ? @cast = attributes[:credits][:cast] : @cast = nil 
  end
end
