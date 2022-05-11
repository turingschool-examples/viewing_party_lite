class Movie
  attr_reader :vote_average, :title

  def initialize(data)
    @vote_average = data[:vote_average]
    @title = data[:original_title]
  end
end