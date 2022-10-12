require 'json'
require './app/services/movie_service'

class MovieFacade
  def self.info_card(movie_id)
    response = MovieService.request(movie_id)

    parsed = JSON.parse(response.body)

    { title: parsed['original_title'], img_path: parsed['poster_path'] }
  end

  def self.popular
    response = MovieService.request('', 'popular')

    parsed = JSON.parse(response.body)

    { title: parsed['origninal_title'], vote_avg: parsed['vote_average'] }
  end

  def self.show(movie_id)
    details = show_details(movie_id)

    credits = show_credits(movie_id)

    reviews = show_reviews(movie_id)

    { details: details, credits: credits, reviews: reviews }
  end

  def self.new_party(movie_id)
    response = MovieService.request(movie_id)

    parsed = JSON.parse(response.body)

    { title: parsed['original_title'], runtime: parsed['runtime'] }
  end

  # _Private Class Methods_____________________________________________________________________________________

  def self.show_details(movie_id)
    response = MovieService.request(movie_id)

    parsed = JSON.parse(response.body)

    {
      title: parsed['original_title'], vote_avg: parsed['vote_average'], runtime: parsed['runtime'],
      genres: parsed['genres'].map { |genre| genre['name'] }, summary: parsed['overview']
    }
  end

  def self.show_credits(movie_id)
    response = MovieService.request(movie_id, '/credits')

    parsed = JSON.parse(response.body)

    parsed['cast'][0..9].map { |member| { actor: member['name'], role: member['character'] } }
  end

  def self.show_reviews(movie_id)
    response = MovieService.request(movie_id, '/reviews')

    parsed = JSON.parse(response.body)

    parsed['results'].map { |review| { author: review['author'], content: review['content'] } }
  end

  private_class_method :show_details, :show_credits, :show_reviews
end
