class Movie
  attr_reader :title,
              :vote_average,
              :id

  def initialize(result)
    @title = result[:title]
    @vote_average = result[:vote_average]
    @id = result[:id]
  end
end
