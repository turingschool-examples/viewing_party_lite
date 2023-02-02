class Review
  attr_reader :id,
              :author,
              :content
  def initialize(response)
    @id = response[:id] #in base hash
    @author = response[:author] #in a hash in an array in base hash
    @content = response[:content] #in a hash in an array 
  end
end