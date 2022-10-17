class MovieDetailPresenter
  attr_reader :user_id,
              :movie,
              :top_10_cast,
              :reviews

  def initialize(user_id, movie_id)
    @user_id = user_id
    @movie = MovieFacade.movie_by_id(movie_id)
    @top_10_cast = MovieFacade.top_10_cast(movie_id)
    @reviews = ReviewFacade.get_review_info(movie_id)
  end

  def title
    @movie.title
  end

  def average_votes
    @movie.average_votes
  end

  def runtime
    "#{@movie.runtime / 60}:#{@movie.runtime % 60}" 
  end

  def genres
    @movie.genres.join(', ')
  end

  def overview
    @movie.overview
  end

  def review_count
    @reviews.size
  end

  def poster_path
    @movie.poster_path
  end
end
