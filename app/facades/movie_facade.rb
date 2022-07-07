# frozen_string_literal: true

class MovieFacade
  def self.top_rated_movies
    json = MovieService.top_rated_movies('/3/movie/top_rated?api_key=02f6db89ebe8897a06342829374c182c&language=en-US&page=1')
    json2 = MovieService.top_rated_movies('/3/movie/top_rated?api_key=02f6db89ebe8897a06342829374c182c&language=en-US&page=2')

    top_40 = json[:results] + json2[:results]

    @movies = top_40.map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
