class ReviewFacade
  def self.get(id)
    path = "/3/movie/#{id}/reviews"
    data = SubService.ping(id, path)

    reviews = data[:results]

    reviews.map do |review_data|
      Review.new(review_data)
    end
  end
end
