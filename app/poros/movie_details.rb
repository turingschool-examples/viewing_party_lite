class MovieDetails
  attr_reader :movie_id,
              :title,
              :rating,
              :runtime,
              :genres,
              :summary,
              :reviews,
              :cast,
              :poster_path

  def initialize(data)
    @movie_id = data[:id]
    @title = data[:title]
    @rating = data[:vote_average].round(1)
    @runtime = data[:runtime]
    @genres = data[:genres].map { |genre| genre[:name] }
    @summary = data[:overview]
    @reviews = data[:reviews][:results].map { |review| [review[:author], review[:content]] }
    @cast = data[:credits][:cast].map { |person| [person[:name], person[:character]] }.first(10)
    @poster_path = data[:poster_path]
  end
end