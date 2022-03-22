require './app/poros/review'

class ReviewFacade
    attr_reader :reviews
    def initialize(movie_id)
        @reviews = []
        ReviewService.reviews(movie_id)[:results].each do |review|
            @reviews << Review.new(review)
        end
    end
end