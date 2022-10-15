class MovieResult
  attr_reader :id, :title, :vote_average, :runtime, :genres, :summary, :poster

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    @poster = 'https://image.tmdb.org/t/p/original' + data[:poster_path] if data[:poster_path]
  end

  def formatted_runtime
    hours = runtime / 60
    minutes = runtime % 60
    "#{hours} hours #{minutes} minutes"
  end
end
