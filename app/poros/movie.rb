class Movie
  attr_reader :title
  def initialize(data)
    @title = data[:original_title]
  end
end
