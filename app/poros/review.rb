class Review
  attr_reader :author_name,
              :author_review

  def initialize(review_data)
    @author_name = review_data[:author]
    @author_review = review_data[:content]
  end

end