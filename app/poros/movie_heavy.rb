require './app/services/movies_service'

class MovieHeavy
  attr_reader :id,
              :movie_title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :first_10_cast_members,
              :reviews_count

  def initialize(data)
    @id = data[:id]
    @movie_title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    @first_10_cast_members = MoviesService.credits(data[:id])[:cast].first(10)
    @reviews_count = MoviesService.reviews(data[:id])[:results].size
  end
end