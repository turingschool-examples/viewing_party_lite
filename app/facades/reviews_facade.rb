# frozen_string_literal: true

class ReviewsFacade
  def self.reviews(movie_id)
    json = MoviesService.reviews(movie_id)

    reviews = json[:results].map do |review|
      Review.new(review)
    end
  end
end
