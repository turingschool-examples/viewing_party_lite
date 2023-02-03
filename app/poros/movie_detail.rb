class MovieDetail 
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :backdrop_path

  def initialize(movie_detail_data)
    @title = movie_detail_data[:title]
    @vote_average = movie_detail_data[:vote_average]
    @runtime = movie_detail_data[:runtime]
    @genres = movie_detail_data[:genres]
    @overview = movie_detail_data[:overview]
    @backdrop_path = movie_detail_data[:backdrop_path]
  end

  def list_genres
    @genres.map do |genre|
      genre[:name]
    end.join(', ')
  end
end