# frozen_string_literal: true

class Movie
  attr_reader :title

  def initialize(data)
    @title = data[:title]
  end
end
