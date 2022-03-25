class Movie
  attr_reader :id,
              :title,
              :vote_average

  def initialize(result)
    @id = result[:id]
    @title = result[:title]
    @vote_average = result[:vote_average]
  end
end
