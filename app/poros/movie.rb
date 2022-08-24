class Movie
  attr_reader :id, :title

  def initialize(data)
    @title = data[:original_title]
    @vote_average = data[:vote_average]
  end

end