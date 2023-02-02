class MovieFacade
  def self.find_movie(uri)
    @movie = Movie.new(filter_movies(uri))
  end

  def self.find_cast(uri)
    @cast = filter_credits(uri).map do |character|
      Character.new(character)
    end
  end

  def self.find_reviews(uri)
    @reviews = filter_response(uri).map do |review|
      Review.new(review)
    end
  end

  def self.find_movies(uri)
    if filter_movies(uri)[:success] == false
      filter_movies(uri)
    else
      filter_movies(uri)[:results].map do |movie|
        Movie.new(movie)
      end
    end
  end

  private

  def self.filter_movies(uri)
    MovieService.parse_response(uri)
  end

  def self.filter_response(uri)
    MovieService.parse_response(uri)[:results]
  end

  def self.filter_credits(uri)
    MovieService.parse_response(uri)[:cast][0..9]
  end
end