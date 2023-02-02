class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genre,
              :summary

  def initialize(movie_params)
    @id = movie_params['id']
    @title = movie_params['original_title']
    @vote_average = movie_params['vote_average']
    @runtime = movie_params['runtime']
    @genre = movie_params['genre']
    @summary = movie_params['summary']
  end
end
