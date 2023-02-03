class Review
  attr_reader :author, :content

  def initialize(data)
    @author = data[:author]
    @content = content_strip(data[:content])
  end

  def content_strip(content)
    content.gsub('’', "'")
  end
end