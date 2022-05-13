class Movie 
  attr_reader :title, :id, :vote_average

  def initialize(data)
    @title = data[:title]
    @id = data[:id]
    @vote_average = data[:vote_average]
  end 
end 