class Movie
  attr_reader :title, :vote_average, :id, :cast, :runtime, :genres, :summary, :reviews
  def initialize(movie_data)
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @id = movie_data[:id]
    @cast = get_cast(movie_data)
    @runtime = movie_data[:runtime]
    @genres = get_genres(movie_data)
    @summary = movie_data[:overview]
    @reviews = get_reviews(movie_data)
  end

  def get_cast(movie_data)
    if !movie_data[:credits].nil?
      movie_data[:credits][:cast][0..9]
    end
  end

  def get_genres(movie_data)
    if !movie_data[:genres].nil?
      movie_data[:genres].map {|g| g[:name]}
    end
  end

  def get_reviews(movie_data)
    if !movie_data[:reviews].nil?
      movie_data[:reviews][:results]
    end
  end
end
