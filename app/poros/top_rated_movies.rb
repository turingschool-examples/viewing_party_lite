class TopRatedMovies
  attr_reader :title,
              :vote_avg

  def initialize(result)
    @title = result[:title]
    @vote_avg = result[:vote_average]
  end
end