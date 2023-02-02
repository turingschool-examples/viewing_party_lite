class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :hours_mins,
              :success,
              :overview

  def initialize(data)
    @id           = data[:id]
    @title        = data[:title]
    @vote_average = data[:vote_average]
    @runtime      = data[:runtime]
    @overview     = data[:overview]
    @hours_mins   = convert_runtime(data[:runtime]) if data[:runtime]
    @genres       = convert_genres(data[:genres]) if data[:genres]
    @success      = data[:success]
  end

  def convert_runtime(runtime)
    "#{runtime / 60}hr #{runtime % 60}min"
  end

  def convert_genres(genres)
    genres.map { |genre| genre[:name] }
  end
end