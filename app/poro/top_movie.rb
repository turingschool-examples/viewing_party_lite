class TopMovie 
  attr_reader :title, :rating

  def initialize(movie_api_data)
    @title = movie_api_data[:title]
    @rating = movie_api_data[:vote_average]
  end
end