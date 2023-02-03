class MovieReview
  attr_reader :author, :rating, :content

  def initialize(review_information)
    @author = review_information[:author]
    @rating = review_information[:author_details][:rating]
    @content = review_information[:content]
  end
end

