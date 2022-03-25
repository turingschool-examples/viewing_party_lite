class MovieFacade
  def self.movie_reviews(movie_id)
    reviews_data = MovieService.get_movie_reviews(movie_id)
    reviews_data[:results].map do |review|
      MovieReview.new(review)
    end
  end
end
