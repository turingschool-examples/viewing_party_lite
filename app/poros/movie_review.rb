class MovieReview
  attr_reader :author, :content

    def initialize(attributes)
      @author = attributes[:author]
      @content = attributes[:content]
    end
end
