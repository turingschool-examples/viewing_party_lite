class Movie
  attr_reader :title, :vote_average, :id, :genres, :runtime, :overview, :top_cast_members, :reviews

  def initialize(movie_data)
    @id = movie_data[:id] if movie_data[:id]
    @title = movie_data[:title] if movie_data[:title]
    @vote_average = movie_data[:vote_average] if movie_data[:vote_average]
    @runtime = movie_data[:runtime] if movie_data[:runtime]
    @genres = movie_data[:genres] if movie_data[:genres]
    @overview = movie_data[:overview] if movie_data[:overview]
    @top_cast_members = movie_data[:cast] if movie_data[:cast]
    @reviews = movie_data[:reviews] if movie_data[:reviews]
  end

  def runtime_to_hours
    "#{@runtime/60} hr #{@runtime%60} min"
  end

  
end