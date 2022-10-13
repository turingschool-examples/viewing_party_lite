class MovieInfo

  attr_reader :title, :image, :rating, :runtime, :genre, :summary

  def initialize(movie_api_data)
    @title = movie_api_data[:title]
    @image = 'https://image.tmdb.org/t/p/w500' + movie_api_data[:poster_path]
    @rating = movie_api_data[:vote_average]
    @runtime = movie_api_data[:runtime]
    @genre = movie_api_data[:genres][0][:name]
    @summary = movie_api_data[:overview]
  end
end