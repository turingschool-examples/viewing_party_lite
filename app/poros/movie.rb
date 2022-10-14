class Movie
  attr_reader :title,
              :vote_avg,
              :runtime,
              :img_path,
              :id,
              :summary,
              :genres

  def initialize(movie_data)
    @title = movie_data['original_title']
    @vote_avg = movie_data['vote_average']
    @runtime = movie_data['runtime']
    @img_path = movie_data['poster_path']
    @id = movie_data['id']
    @summary= movie_data['overview']
    @genres = find_genres(movie_data)
  end

  private

  def find_genres(movie_data)
    movie_data['genres'].map { |genre| genre['name'] }
  end

  def find_cast(cast_data)

  end
end