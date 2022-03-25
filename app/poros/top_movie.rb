class TopMovie
  attr_reader :title, :vote

  def initialize(attributes)
    @title = attributes[:original_title]
    @vote = attributes[:vote_average]
  end

end
