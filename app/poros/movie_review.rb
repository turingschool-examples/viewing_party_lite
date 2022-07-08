class MovieReview
  attr_reader :name, :rating, :review
  
  def initialize(data)
    @name = data[:author]
    @rating = data[:author_details][:rating]
    @review = data[:content]
  end
end