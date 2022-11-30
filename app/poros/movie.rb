class Movie
  attr_reader :title, :vote_average, :runtime, :genres, :summary, :cast, :review_count, :reviews
  def initialize(movie_attributes, cast_attributes, review_attributes)
    @title = movie_attributes[:title]
    @vote_average = movie_attributes[:vote_average]
    @runtime = movie_attributes[:runtime]
    @genres = movie_attributes[:genres]
    @summary = movie_attributes[:overview]
    @cast = cast_attributes[:cast]
    @review_count = review_attributes[:total_results]
    @reviews = {}
    
    @review_count.times do |index|
      @reviews[review_attributes[:results][index][:author]] = review_attributes[:results][index][:author_details][:rating]
    end
    # require 'pry'; binding.pry
  end
end
