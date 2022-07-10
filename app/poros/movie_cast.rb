# frozen_string_literal: true

class MovieCast
  attr_reader :name,
              :character

  def initialize(data)
    @name = data[:name]
    @character = data[:character]
  end
end
