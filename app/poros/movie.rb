class Movie
  attr_reader :title

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
  end
end