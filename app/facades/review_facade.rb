class ReviewFacade
   def self.get_review_info(movie_id)
    json = ReviewService.get_review_info(movie_id)
    json[:results].map do |review_data|
      Review.new(review_data)
    end
   end
end