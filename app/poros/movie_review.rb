class MovieReview
  attr_reader :author, 
              :content,
              :id,
              :number_reviews
  
  def initialize(attributes, movie_id, number_reviews)
    @author = attributes[:author]
    @content = attributes[:content]
    @id = movie_id
    @number_reviews = number_reviews
  end
end