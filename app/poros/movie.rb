class Movie
  attr_reader :title, :id, :vote_average
  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
  end
end