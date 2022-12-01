class Review
  attr_reader :author,
              :content

  def initialize(data)
    @author = data[:author_details][:name]
    @content = data[:content]
  end
  
end
