class Movie
  attr_reader :title,
              :vote_average,
              :id,
              :image_path,
              :runtime,
              :genre,
              :overview

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @id = data[:id]
    @image_path = data[:poster_path]
    @runtime = data[:runtime]
    @genre = data[:genres]
    @overview = data[:overview]
  end

  def genres
    @genre.map { |g| g[:name] }.join(",")
  end

  def runtime_formatted
    "#{@runtime/60}hr #{@runtime % 60} min"
  end
end
