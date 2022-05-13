class MovieDetail
  attr_reader :title, :vote_average, :runtime, :genre, :summary, :id, :poster

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genre = data[:genres]
    @summary = data[:overview]
  end

  def genre_names
    @genre.map do |genre|
      genre
    end
  end
end
