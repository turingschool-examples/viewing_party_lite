# frozen_string_literal: true

class MovieCast
  attr_reader :cast_list

  def initialize(attributes)
    @cast_list = attributes[:cast]
  end

  def cast
    @cast_list.map { |member| "#{member[:name]} as #{member[:character]}" }
  end
end
