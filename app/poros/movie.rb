class Movie 
  attr_reader :title,
              :average_votes,
              :id,
              :poster_path

  def initialize(data)
    @title = data[:title]
    @average_votes = data[:vote_average]
    @id = data[:id]
    @poster_path = data[:poster_path]
  end
end
