class Movie
  attr_reader :title, :id, :vote_average

  def initialize(info)
    @title = info[:title]
    @id = info[:id]
    @vote_average = info[:vote_average]
  end
end
