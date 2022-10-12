class Movie
  attr_reader :title,
              :vote_average
              # :runtime
              # :genre,
              # :summary,
              # :cast,
              # :reviews,

  def initialize(attributes)
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    # @runtime = attributes[:run_time]
  end
end
