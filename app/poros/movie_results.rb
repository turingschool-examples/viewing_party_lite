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

  # def time_conversion(minutes)
  #   hours = minutes / 60
  #   rest = minutes % 60
  #   "#{hours}:#{rest}" 
  # end
end