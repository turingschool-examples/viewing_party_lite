class Review
  attr_reader :id,
              :author,
              :content
  def initialize(response)
    # binding.pry
    @id = response[:id] #in base hash
    # binding.pry
    @author = response[:author_details][:username] #in a hash in an array in base hash
    @content = response[:content] #in a hash in an array 
  end
  
  # def author_name
  # 
  # end
end