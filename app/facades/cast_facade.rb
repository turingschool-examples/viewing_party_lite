# frozen_string_literal: true

require './app/poros/cast_member'

class CastFacade
  attr_accessor :top_cast

  def initialize(movie_id)
    complete_cast = []
    CastService.information(movie_id).each do |cast|
      complete_cast << CastMember.new(cast)
    end
    @top_cast = complete_cast.first(10)
  end
end
