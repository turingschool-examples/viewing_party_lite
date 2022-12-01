class ReviewsFacade
  def self.reviews(movie_id)
    json = MoviesService.reviews(238)

    reviews = json[:results].map do |review|
      Review.new(review)
    end
  end
end