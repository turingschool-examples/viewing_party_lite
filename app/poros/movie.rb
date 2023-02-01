class Movie 
  attr_reader :id, 
              :title, 
              :vote_average
              
  def initialize(movie_params)
    @id = movie_params["id"]
    @title = movie_params["original_title"]
    @vote_average = movie_params["vote_average"]
  end
end