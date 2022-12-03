class MinMovie
  attr_reader :title,
              :vote_avg,
              :img_path,
              :id

  def initialize(movie_data)
    @title = movie_data[:title]
    @vote_avg = movie_data[:vote_average]
    @img_path = movie_data[:poster_path]
    @id = movie_data[:id]
  end
end