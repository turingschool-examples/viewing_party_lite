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

  def self.details(id)
    data = MovieService.details(id)
    Movie.new(data)
  end

  def self.cast_members(movie_id)
    cast = MovieService.cast_members(movie_id)[:cast][0..9]
    cast.map do |cast_member_hash|
      CastMember.new(cast_member_hash)
    end
  end

  def self.reviews(movie_id)
    data = MovieService.reviews(movie_id)
    data[:results].map do |review_data|
      Review.new(review_data)
    end
  end
end
