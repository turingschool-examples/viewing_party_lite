class Reviews
  attr_reader :author, :content

  def initialize(review_api_data)
    @author = review_api_data[:author]
    @content = review_api_data[:content]
  end
end
