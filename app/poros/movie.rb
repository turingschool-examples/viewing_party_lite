class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :overview,
              :cast,
              :reviews,
              :image_path

  def initialize(movie_params)
    @id = movie_params[:id]
    @title = movie_params[:original_title]
    @vote_average = movie_params[:vote_average]
    @runtime = movie_params[:runtime]
    @genres = movie_params[:genres]
    @overview = movie_params[:overview]
    @cast = movie_params[:cast].try(:first, 10)
    @reviews = movie_params[:results]
    @image_path = base_image_uri + movie_params[:poster_path]
  end

  # TODO: Consider Cast and Review poros

  def genres
    @genres.map do |genre|
      genre[:name]
    end.join(', ')
  end

  def review_total
    @reviews.length
  end

  private 

  def base_image_uri
    "https://image.tmdb.org/t/p/w500/"
  end
end
