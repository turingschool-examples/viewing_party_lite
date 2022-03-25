# frozen_string_literal: true

class Review
  attr_reader :author, :content

  def initialize(data)
    @author = data[:author]
    @content = data[:content]
  end
end
