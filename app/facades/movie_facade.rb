class MovieFacade
  def self.create_top_rated
    json = MovieService.top_rated
    json.map { |data| Movie.new(data) }
  end

  def self.create_searched(query)
    json = MovieService.search(query)
    json.map { |data| Movie.new(data) }
  end

  def self.create_movie(id)
    json = MovieService.details(id)
    Movie.new(json)
  end

  def self.create_cast_members(id)
    json = MovieService.cast(id)
    json[0..9].map { |data| CastMember.new(data) }
  end

  def self.create_reviews(id)
    json = MovieService.reviews(id)
    Reviews.new(json)
  end
end
