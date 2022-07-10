class Review
  attr_reader :name, 
              :review

  def initialize(data)
    @name = data[:author]
    @review = data[:content]
  end
end
