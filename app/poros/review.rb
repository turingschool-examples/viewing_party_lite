class Review
  attr_reader :author,
              :rating,
              :content

  def initialize(review_data)
    @author  = review_data[:author]
    @rating  = review_data[:author_details][:rating]
    @content = review_data[:content]
  end
end
