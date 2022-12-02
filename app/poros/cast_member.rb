# frozen_string_literal: true

class CastMember
  attr_reader :name, :character

  def initialize(result)
    @name = result[:name]
    @character = result[:character]
  end
end
