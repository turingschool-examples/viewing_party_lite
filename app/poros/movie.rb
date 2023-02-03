class Movie
  attr_reader :id,
              :title,
              :vote_avg,
              :runtime,
              :summary,
              :poster_path

  def initialize(movie_data)
    @id          = movie_data[:id]
    @title       = movie_data[:title]
    @vote_avg    = movie_data[:vote_average]
    @runtime     = movie_data[:runtime]
    @genre_data  = movie_data[:genres]
    @summary     = movie_data[:overview]
    @poster_path = movie_data[:poster_path]
  end

  def genres
    @genre_data.map { |genre| genre[:name] }
  end
  # Runtime method? To stick with MVC (see calculations in view/movies/show)

  def runtime_calc
    mins = (@runtime.to_i % 60).to_s
    hrs = ((@runtime.to_i - (@runtime.to_i % 60)) / 60).to_s
    hrs + "hr " + mins + "min"
  end
end
