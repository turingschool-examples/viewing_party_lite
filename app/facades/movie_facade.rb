# frozen_string_literal: true

class MovieFacade
  def self.top_40
    json_array = MovieService.top_movies
    json_array.map do |page_hash|
      page_hash[:results].map do |movie_data|
        Movie.new(movie_data)
      end
    end.flatten
  end

  def self.search_by_keyword(keyword)
    json_array = MovieService.movie_search(keyword)
    unless json_array.first[:errors].present?
      json_array.map do |page_hash|
        page_hash[:results].map do |movie_data|
          Movie.new(movie_data)
        end
      end.flatten
    end
  end

  def self.find_movie(id)
    json = MovieService.movie_lookup(id)
    Movie.new(json)
  end

  def self.find_cast(id)
    json = MovieService.cast_lookup(id)
    json[:cast].map do |crew|
      MovieCast.new(crew)
    end[0..9]
  end

  def self.find_review(id)
    json = MovieService.review_lookup(id)
    json[:results].map do |critiques|
      MovieReview.new(critiques)
    end
  end
end
