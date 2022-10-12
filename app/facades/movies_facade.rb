class MoviesFacade
  def self.get_movie(movie_id)
    attributes = {id: movie_id}
    details = MoviesService.movie_details(movie_id)
    images_data = MoviesService.movie_images(movie_id)
    credits_data = MoviesService.movie_credits(movie_id)
    reviews_data = MoviesService.movie_reviews(movie_id)

    attributes[:title] = details[:title]
    attributes[:runtime] = details[:runtime]
    attributes[:summary] = details[:overview]
    attributes[:vote_average] = details[:vote_average]
    attributes[:genres] = details[:genres].map{ |genre| genre[:name] }
    attributes[:image_path] = images_data[:posters].first[:file_path]
    attributes[:cast] = credits_data[:cast][0..9].map do |cast_member|
      {name: cast_member[:name], character: cast_member[:character]}
    end
    attributes[:reviews] = reviews_data[:results].map do |review|
      {author: review[:author], content: review[:content]}
    end

    Movie.new(attributes)
  end

  def self.get_top_20_movies

  end

  def self.get_search_results_movies(search_query)

  end
end