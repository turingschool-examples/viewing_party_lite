class Movie
  attr_reader :title,
              :genre_ids,
              :popularity,
              :vote_average

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @genre_ids = data[:genre_ids]
    @popularity = data[:popularity]
    @vote_average = data[:vote_average]
    @info = MoviesFacade.info(@id)
  end

  def image
    "https://image.tmdb.org/t/p/w500#{@info[:poster_path]}"
  end

  def runtime
    @info[:runtime]
  end
end
