class MovieFacade
  def self.top_rated_results
    MovieService.get_top_rated[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.search_results(keyword)
    MovieService.search(keyword)[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.all_movie_info(movie_id)
    details = details_results(movie_id)
    movie_data = {
                  id: details[:id],
                  title: details[:title],
                  vote_average: details[:vote_average],
                  runtime: details[:runtime],
                  genres: details[:genres],
                  summary: details[:overview],
                  cast: cast_results(movie_id),
                  reviews: reviews_results(movie_id)
                 }
                 require 'pry', binding.pry
    Movie.new(movie_data)
  end

  def self.cast_results(movie_id)
    # require 'pry', binding.pry
    MovieService.get_cast(movie_id)[:cast][0..9].map do |actor_data|
      { name: actor_data[:name], character: actor_data[:character] }
    end
  end

  def self.details_results(movie_id) # runtime, genre, summary
    MovieService.get_details(movie_id)
  end

  def self.reviews_results(movie_id)
    MovieService.get_reviews(movie_id)
  end


end