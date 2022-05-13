class MovieDetail
  attr_reader :title, :vote_average, :runtime_min, :runtime, :genre, :summary, :id, :poster_path

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime] ? "#{data[:runtime] / 60}hr #{data[:runtime] % 60}min" : nil
    @runtime_min = data[:runtime]
    @genre = data[:genres]
    @summary = data[:overview]
    @poster_path = "https://image.tmdb.org/t/p/original#{data[:poster_path]}"
  end

  def genre_names
    @genre.map do |genre|
      genre[:name]
    end
  end
end
