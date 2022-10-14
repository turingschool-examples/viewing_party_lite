class TopMovie 
  attr_reader :id, :title, :rating

  def initialize(movie_api_data)
    @id = movie_api_data[:id]
    @title = movie_api_data[:title]
    @rating = movie_api_data[:vote_average]
  end
end