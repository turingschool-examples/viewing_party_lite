class Movie 
  attr_reader :title,
              :average_votes,
              :id

  def initialize(data)
    @title = data[:title]
    @average_votes = data[:vote_average]
    @id= data[:id]

  end
end