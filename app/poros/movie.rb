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

  def runtime_calc
    movie_runtime = @runtime.to_i
    mins = (movie_runtime % 60).to_s
    hrs = ((movie_runtime - (movie_runtime % 60)) / 60).to_s
    hrs + "hr " + mins + "min"
  end
end
