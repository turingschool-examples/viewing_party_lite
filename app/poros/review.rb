# frozen_string_literal: true

class Review
  attr_reader :review_id,
              :author,
              :content,
              :rating

  def initialize(response)
    @review_id = response[:id] # in base hash
    @author = response[:author] # in a hash in an array in base hash
    @content = response[:content] # in a hash in an array
    author_details = response[:author_details]
    @rating = author_details[:rating]
  end
end
