# frozen_string_literal: true

class MovieFacade < MovieService
  def self.top_rated_poro
    top_rated[:results].map do |movie|
      MoviesTopRated.new(movie)
    end
  end

  def self.credits_poro(movie_id)
    credits(movie_id)[:cast].map do |cast_member|
      Credits.new(cast_member)
    end.slice(0, 10)
  end

  def self.reviews_poro(movie_id)
    reviews(movie_id)[:results].map do |review|
      Reviews.new(review)
    end
  end

  def self.details_poro(movie_id)
    Details.new(details(movie_id))
  end

  def self.search_poro(keyword)
    search(keyword)[:results].map do |movie|
      Search.new(movie)
    end
  end

end
