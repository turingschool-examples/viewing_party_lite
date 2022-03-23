class MovieRep
  attr_reader :title, :vote_average

  def initialize(result)
    @title = result['title']
    @vote_average = result['vote_average']
  end
end
