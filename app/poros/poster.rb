# frozen_string_literal: true

class Poster
  attr_reader :url

  def initialize(attributes)
    @url = attributes[:poster_path]
  end
end
