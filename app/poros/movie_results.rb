class MovieResults
  attr_reader :title,
              :vote_avg,
              :id,
              :runtime,
              :genres,
              :overview,
              :vote_count
  def initialize(movie)
    @title = movie[:title]
    @vote_avg = movie[:vote_average]
    @id = movie[:id]
    @runtime = movie[:runtime]
    @genres = movie[:genres]
    @summary = movie[:overview]
    @review_count = movie[:vote_count]
  end
end