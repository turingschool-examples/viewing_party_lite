class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime

  def initialize(result)
    @id = result[:id]
    @title = result[:title]
    @runtime = result[:runtime]
    @vote_average = result[:vote_average]
  end
end
