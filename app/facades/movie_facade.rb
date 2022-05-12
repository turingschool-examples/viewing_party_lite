class MovieFacade
  class << self
    def top_movies
      page1 = MovieService.get_data('movie/top_rated?page=1')
      page2 = MovieService.get_data('movie/top_rated?page=2')

      total_results = page1[:results] + page2[:results]
      total_results.map do |result|
        Movie.new(result)
      end
    end

    def search(title)
      page1 = MovieService.get_data("search/movie?query=#{title}&page=1")
      page2 = MovieService.get_data("search/movie?query=#{title}&page=2")

      total_results = page1[:results] + page2[:results]
      total_results.map do |result|
        Movie.new(result)
      end
    end
  end
end
