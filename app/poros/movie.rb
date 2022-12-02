class Movie 
  attr_reader :id, :title, :vote

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote = data[:vote_average]
  end
end