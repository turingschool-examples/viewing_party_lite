class Review
  attr_reader :id,
              :author,
              :content
  def initialize(response)
    # binding.pry
    @id = response[:results][:id] #in base hash
    @author = response[:results][:author] #in a hash in an array in base hash
    @content = response[:results][:content] #in a hash in an array 
  end
  
  def author_name
    
  end
end