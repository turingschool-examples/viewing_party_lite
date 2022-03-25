class MovieDetail
  attr_reader :id,
              :title,
              :runtime,
              :genres,
              :summary,
              :vote_average,
              :cast,
              :reviews,
              :review_count,
              :poster_path

  def initialize(movie_details, _movie_cast, _movie_reviews)
    @id = movie_details[:id]
    @title = movie_details[:title]
    runtime = movie_details[:runtime]
  end
end
