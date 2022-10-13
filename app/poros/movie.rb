class Movie
  attr_reader :id,
              :title,
              :vote_average
              # :runtime
              # :genre,
              # :summary,
              # :cast,
              # :reviews,

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    # @runtime = attributes[:run_time]
  end
end


