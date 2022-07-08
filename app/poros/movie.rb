class Movie
  attr_reader :title,
              :vote_average,
              :movie_id
              
  def initialize(data)
    @title = data[:original_title]
    @vote_average = data[:vote_average]
    @movie_id = data[:id]
  end
end
