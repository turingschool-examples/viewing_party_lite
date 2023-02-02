class ShowMovie
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :overview

  def initialize(movie_information)
    @title = movie_information[:title]
    @vote_average = movie_information[:vote_average]
    @runtime = time_conversion(movie_information[:runtime])
    @genres = list_genres(movie_information[:genres])
    @overview = movie_information[:overview]
  end

  def time_conversion(minutes)
    hours = minutes / 60
    rest = minutes % 60
    "#{hours} hour(s) #{rest} min" 
  end

  def list_genres(genres)
    genres.map do |genre|
      genre[:name]
    end
  end
end