class MovieInfo
  attr_reader :id, :title, :image, :rating, :runtime, :genre, :summary

  def initialize(movie_api_data)
    @id = movie_api_data[:id]
    @title = movie_api_data[:title]
    @image = 'https://image.tmdb.org/t/p/w500' + movie_api_data[:poster_path]
    @rating = movie_api_data[:vote_average].round(1)
    @runtime = movie_api_data[:runtime]
    @genre = movie_api_data[:genres].map { |genre_hash| genre_hash[:name] }
    @summary = movie_api_data[:overview]
  end

  def runtime_in_hours
    "#{@runtime / 60}hr #{@runtime % 60}min"
  end

  def genre_list
    @genre.join(', ')
  end
end
