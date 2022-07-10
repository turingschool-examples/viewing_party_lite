class Movie
  attr_reader :title,
              :vote_average,
              :movie_id,
              :poster
              
  def initialize(data)
    @title = data[:original_title]
    @vote_average = data[:vote_average]
    @movie_id = data[:id]
    @poster = data[:poster_path]
  end
end
