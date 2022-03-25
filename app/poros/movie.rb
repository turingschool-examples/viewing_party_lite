class Movie
  attr_reader :title,
              :vote_average,
              :id,
              :runtime,
              :vote_count,
              :genres,
              :poster_path,
              :summary,
              :cast

  def initialize(movie_data)
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @id = movie_data[:id]
    @runtime = movie_data[:runtime]
    @vote_count = movie_data[:vote_count]
    @genres = movie_data[:genres]
    @poster_path = movie_data[:poster_path]
    @summary = movie_data[:overview]

  end

  def runtime_converted
    hours = @runtime / 60
    minutes = @runtime % 60
    return "#{hours}hr #{minutes}min"
  end
end
