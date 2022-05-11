class ReviewFacade
  def self.reviews(movie_id)
    data = MovieService.reviews(movie_id)

    data[:results].map do |review_data|
      Review.new(review_data)
    end
  end
end
