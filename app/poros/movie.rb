class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast

  def initialize(movie_params)
    @id = movie_params[:id]
    @title = movie_params[:original_title]
    @vote_average = movie_params[:vote_average]
    @runtime = movie_params[:runtime]
    @genres = genre_parse(movie_params[:genres])
    @overview = movie_params[:overview]
    @cast = movie_params[:cast]
  end

  def genre_parse(data) 
    data.map do |genre|
      genre[:name]
    end.join(', ')
  end

  #placeholder method
  def image
    'image'
  end
end
