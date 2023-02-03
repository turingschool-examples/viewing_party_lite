class MovieReviewFacade
  def self.movie_review(movie_id)
    data = TMDBService.get_movie_reviews(movie_id)
    results = data[:results]
    results.map do |review|
      MovieReview.new(review)
    end
  end
end