# frozen_string_literal: true

class Reviews
  attr_reader :author,
              :content

  def initialize(api)
    @author = api[:author]
    @content = api[:content]
  end
end
