class MovieFacade 
  class << self
    def get_list_of_movies(movie)
      data = MovieService.call_for_a_movie(movie)
      movies(data)
    end

    def get_top_20_movies 
      data = MovieService.call_for_top_20_movies
      movies(data)
    end 
    private 
    
    def movies(data) 
      data[:results].map do |result| 
        Movie.new(title: result[:title], vote_average: result[:vote_average])
      end 
    end 
  end
end 