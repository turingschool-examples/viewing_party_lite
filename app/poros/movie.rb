class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :overview,
              :cast,
              :reviews

  def initialize(movie_params)
    @id = movie_params[:id]
    @title = movie_params[:original_title]
    @vote_average = movie_params[:vote_average]
    @runtime = movie_params[:runtime]
    @genres = movie_params[:genres]
    @overview = movie_params[:overview]
    @cast = movie_params[:cast].try(:first, 10)
    @reviews = movie_params[:results]
  end

  #TODO: Consider Cast and Review poros 

  #TODO: This isn't the place for this data parsing?
  def genres 
    @genres.map do |genre|
      genre[:name]
    end.join(', ')
  end

  def review_total
    @reviews.length
  end

  def image

  end
end
