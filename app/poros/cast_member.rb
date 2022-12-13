# frozen_string_literal: true

class CastMember
  attr_reader :character,
              :actor

  def initialize(data)
    @character = data[:character]
    @actor = data[:name]
  end
end
