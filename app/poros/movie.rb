class Movie
  attr_reader :id,
              :title,
              :runtime,
              :overview,
              :genres,
              :poster_path,
              :vote_average,
              :review_content,
              :review_count,
              :cast

  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:title]
    @runtime = movie_data[:runtime]
    @overview = movie_data[:overview]
    @genres = movie_data[:genres]
    @image_path = movie_data[:poster_path]
    @vote_average = movie_data[:vote_average]
    @review_count = movie_data[:review_count]
    @review_content = movie_data[:review_content]
    @cast = movie_data[:cast]
  end
end