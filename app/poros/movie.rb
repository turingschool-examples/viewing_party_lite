class Movie

  attr_reader :original_title, :vote_average, :over_view, :runtime, :genres, :id

  def initialize(movie_data)
    @original_title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
    @overview = movie_data[:overview]
    @runtime = movie_data[:runtime]
    @id = movie_data[:id]
    #@genres = movie_data[:genres][:name]
  end

end
