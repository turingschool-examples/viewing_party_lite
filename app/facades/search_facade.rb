class SearchFacade
  def self.search(title)
    @movies = []
    found = MovieService.search(title)
    found[:results].each do |movie|
      if MovieService.movie(movie[:id])[:runtime] != nil
        @movies << Movie.new(MovieService.movie(movie[:id]))
      end
    end
    @movies
  end
end
