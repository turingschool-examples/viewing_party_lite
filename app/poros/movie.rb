class Movie
  attr_reader :id,
              :movie_title,
              :movie_image,
              :vote_average,
              :runtime,
              :genres,
              :summary_description,
              :total_reviews,
              :reviews,
              :cast

  def initialize(movie_details, movie_reviews, movie_credits)
    @id = movie_details[:id]
    @movie_title = movie_details[:title]
    @movie_image = movie_details[:poster_path]
    @vote_average = movie_details[:vote_average]
    @runtime = (movie_details[:runtime]).round(2)
    @genres = get_genres(movie_details)
    @summary_description = movie_details[:overview]
    @total_reviews = movie_reviews[:total_results]
    @reviews = get_reviews(movie_reviews)
    @cast = get_cast(movie_credits)
  end

  def get_genres(movie_details)
    movie_details[:genres].map do |key|
      key[:name]
    end
  end

  def get_cast(movie_credits)
    movie_credits[:cast].sort_by{ |actor| actor[:order].to_i }.map do |actor|
      [actor[:name], actor[:character]]
    end.first(10)
  end

  def get_reviews(movie_reviews)
    review_hash = {}
    movie_reviews[:results].each do |review|
      review_hash[review[:author]] = review[:content]
    end
    review_hash
  end
end