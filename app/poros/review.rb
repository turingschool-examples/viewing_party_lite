class Review
  attr_reader :author, 
              :content 

  def initialize(data)
    @author  = data[:author]
    @summary = data[:content]
  end
end