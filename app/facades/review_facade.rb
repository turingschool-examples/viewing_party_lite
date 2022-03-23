# frozen_string_literal: true

require './app/poros/review'

class ReviewFacade
attr_reader :reviews
  def initialize(movie_id)
    @reviews = []
    MovieService.reviews(movie_id)[:results].each do |review|
      @reviews << Review.new(review)
    end
  end
end
