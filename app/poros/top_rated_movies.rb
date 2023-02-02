class TopRatedMovies
  attr_reader :title,
              :vote_avg,
              :id

  def initialize(result)
    @title = result[:title]
    @vote_avg = result[:vote_average]
    @id = result[:id]
  end
end