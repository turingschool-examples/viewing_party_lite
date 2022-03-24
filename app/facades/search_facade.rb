class SearchFacade
  def self.search(title)
    @movies = []
      found = MovieService.search(title)
      found[:results].each do |movie|
        @movies << Movie.new(MovieService.movie(movie[:id]))
      end
    @movies
  end
end
