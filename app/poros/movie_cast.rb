# frozen_string_literal: true

class MovieCast
  attr_reader :cast
  def initialize(attributes)
    @cast = attributes[:cast]
  end

  def cast
    @cast.map { |member| "#{member[:name]} as #{member[:character]}" }
  end
end
