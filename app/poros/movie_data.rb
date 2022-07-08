class MovieData
  attr_reader :name,
              :avg,
              :runtime,
              :genres,
              :summary,
              :cast,
              :review_count,
              :review_authors,
              :review_author_details

  def initialize(movie_data)
    @name = movie_data[:title]
    @avg = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @genres = movie_data[:genres]
    @summary = movie_data[:overview]
    @cast = movie_data[:cast]
    @review_count = movie_data[:reviews]
    @review_authors = movie_data[:review_authors]
    @review_author_details = movie_data[:review_author_details]
  end
end
