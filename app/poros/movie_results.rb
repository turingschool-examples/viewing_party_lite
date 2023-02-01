class MovieResults
  attr_reader :title,
              :vote_avg,
              :id
  def initialize(movie)
    @title = movie[:title]
    @vote_avg = movie[:vote_average]
    @id = movie[:id]
  end
end