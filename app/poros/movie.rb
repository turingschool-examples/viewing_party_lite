class Movie
  attr_reader :id, :title

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
  end

end