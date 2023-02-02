class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :overview,
              :cast

  def initialize(movie_params)
    @id = movie_params[:id]
    @title = movie_params[:original_title]
    @vote_average = movie_params[:vote_average]
    @runtime = movie_params[:runtime]
    @genres = movie_params[:genres]
    @overview = movie_params[:overview]
    @cast = movie_params[:cast]
  end

  def genres 
    @genres.map do |genre|
      genre[:name]
    end.join(', ')
  end

  #placeholder method
  def image
    'image'
  end
end
