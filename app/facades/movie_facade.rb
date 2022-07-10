class MovieFacade
  def self.create_top_rated
    json = MovieService.get_top_rated
    json.map { |data| MovieResult.new(data) }
  end

  def self.create_by_keyword(keywords)
    json = MovieService.get_by_keyword(keywords)
    json.map { |data| MovieResult.new(data) }
  end

  def self.create_movie_details(id)
    json = MovieService.get_details(id)
    MovieDetails.new(json)
  end

  def self.create_cast(id)
    json = MovieService.get_cast(id)
    json[0..9].map { |data| CastMember.new(data) }
  end

  def self.create_reviews(id)
    json = MovieService.get_reviews(id)
    Reviews.new(json)
  end
end
