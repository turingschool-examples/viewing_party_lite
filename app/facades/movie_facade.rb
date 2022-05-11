class MovieFacade
  def self.search_results(keyword)
    [1, 2].flat_map do |num|
      MovieService.search(keyword, num)[:results].map do |data|
        Movie.new(data)
      end
    end
  end

  def self.top_20
    MovieService.top_20[:results].map do |data|
      Movie.new(data)
    end
  end
end
