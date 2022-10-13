require 'json'
require './app/services/movie_service'

class MovieFacade
  def self.info_card(movie_id)
    parsed_data = MovieService.request(movie_id)
  
    { title: parsed_data['original_title'], img_path: parsed_data['poster_path'] }
  end

  def self.popular
    parsed_data = MovieService.request('', 'popular')
    
    parsed_data["results"].map do |movie|
      { title: movie['original_title'], vote_avg: movie['vote_average'] }
    end
  end

  def self.show(movie_id)
    details = show_details(movie_id)

    credits = show_credits(movie_id)

    reviews = show_reviews(movie_id)

    { details: details, credits: credits, reviews: reviews }
  end

  def self.new_party(movie_id)
    parsed_data = MovieService.request(movie_id)

    { title: parsed_data['original_title'], runtime: parsed_data['runtime'] }
  end

  # _Private Class Methods_____________________________________________________________________________________

  def self.show_details(movie_id)
    parsed_data = MovieService.request(movie_id)

    {
      title: parsed_data['original_title'], vote_avg: parsed_data['vote_average'], runtime: parsed_data['runtime'],
      genres: parsed_data['genres'].map { |genre| genre['name'] }, summary: parsed_data['overview']
    }
  end

  def self.show_credits(movie_id)
    parsed_data = MovieService.request(movie_id, '/credits')

    parsed_data['cast'][0..9].map { |member| { actor: member['name'], role: member['character'] } }
  end

  def self.show_reviews(movie_id)
    parsed_data = MovieService.request(movie_id, '/reviews')

    parsed_data['results'].map { |review| { author: review['author'], content: review['content'] } }
  end

  private_class_method :show_details, :show_credits, :show_reviews
end
