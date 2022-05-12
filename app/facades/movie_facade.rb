class MovieFacade
  def top_movies
    MovieService.get_top_movies.map { |data| Movie.new(data) }
  end

  def search(params)
    MovieService.get_search(params).map { |data| Movie.new(data) }
  end

  def self.top_10_cast(params)
    MovieService.get_cast(params)[:cast].each do |actor|
      actor[:name]
    end.take(10)
  end

  def self.reviews(params)
    MovieService.get_reviews(params)[:results].each do |review|
      review[:author]
      review[:content]
    end
  end
end
