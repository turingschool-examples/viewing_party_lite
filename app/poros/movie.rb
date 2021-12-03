class Movie

  attr_reader :original_title, :vote_average, :overview, :runtime, :genre, :id, :release_date, :cast

  def initialize(movie_data, movie_cast = [])
    @original_title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
    @overview = movie_data[:overview]
    @runtime = movie_data[:runtime]
    @id = movie_data[:id]
    @release_date = movie_data[:release_date]
    @genre = map_genres(movie_data[:genres])
    @cast = movie_cast
  end

  def map_genres(collection)
    return [] if collection.nil?
    collection.map do |genre|
      genre[:name]
    end
  end

end
