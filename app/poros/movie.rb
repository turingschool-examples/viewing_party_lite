class Movie
  attr_reader :title,
              :vote_avg,
              :runtime,
              :img_path

  def initialize(movie_data)
    @title = movie_data['original_title']
    @vote_avg = movie_data['vote_average']
    @runtime = movie_data['runtime']
    @img_path = movie_data['poster_path']
    @id = movie_data['id']
    @summary= movie_data['overview']
    # @cast = movie_data['cast']
  end
end