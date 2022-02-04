class MovieResults
  attr_reader :title, :id, :vote_average

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
    @vote_average = attributes[:vote_average]
  end
end
