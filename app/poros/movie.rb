class Movie


  attr_reader :original_title, :vote_average, :overview, :runtime, :genres, :id, :release_date


  def initialize(movie_data)
    @original_title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
    @overview = movie_data[:overview]
    @runtime = movie_data[:runtime]
    @id = movie_data[:id]
    @release_date = movie_data[:release_date]
    #@genres = movie_data[:genres][:name]

  end
end
