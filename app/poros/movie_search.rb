class MovieSearch
  attr_reader :title, :vote, :id

  def initialize(attributes)
    @title = attributes[:original_title]
    @vote = attributes[:vote_average]
    @id = attributes[:id]
  end
end
