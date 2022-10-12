class Movie
  attr_reader :movie_id,
              :title,
              :rating
              
  def initialize(data)
    @movie_id = data[:id]
    @title = data[:title]
    @rating = data[:vote_average]
  end
end