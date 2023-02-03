class MovieResult
  attr_reader :id,
              :title,
              :vote_average

  def initialize(movie_result_data)
    @id = movie_result_data[:id]
    @title = movie_result_data[:title]
    @vote_average = movie_result_data[:vote_average]
  end
end