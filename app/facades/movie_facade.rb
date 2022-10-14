require 'json'
require './app/services/movie_service'

class MovieFacade
  def self.info_card(movie_id)
    parsed_data = MovieService.request(movie_id)

    { title: parsed_data['original_title'], img_path: parsed_data['poster_path'] }
  end

  def self.find_movie(movie_id)
    parsed_data = MovieService.request(movie_id)
    Movie.new(parsed_data)
  end

  def self.popular
    parsed_data_p1 = MovieService.request('', 'popular', '&page=1')

    page1 = parsed_data_p1['results'].map do |movie|
      { title: movie['original_title'], vote_avg: movie['vote_average'] }
    end

    parsed_data_p2 = MovieService.request('', 'popular', '&page=2')

    page2 = parsed_data_p2['results'].map do |movie|
      { title: movie['original_title'], vote_avg: movie['vote_average'] }
    end

    (page1 + page2).sort_by { |movie| - movie[:vote_avg].to_f }
  end

  def self.show(movie_id)
    details = show_details(movie_id)

    credits = show_credits(movie_id)

    reviews = show_reviews(movie_id)

    { details: details, credits: credits, reviews: reviews }
  end

  def self.search(query)
    parsed_data_p1 = MovieService.search(query, '1')

    page1 = parsed_data_p1['results'].map do |movie|
      { title: movie['original_title'], vote_avg: movie['vote_average'] }
    end

    parsed_data_p2 = MovieService.search(query, '2')

    page2 = parsed_data_p2['results'].map do |movie|
      { title: movie['original_title'], vote_avg: movie['vote_average'] }
    end

    (page1 + page2).sort_by { |movie| - movie[:vote_avg].to_f }
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
