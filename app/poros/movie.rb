class Movie
  attr_reader :title, :vote_average, :runtime, :genres, :summary, :cast, :review_count, :reviews, :id, :movie_poster
  def initialize(movie_attributes, cast_attributes, review_attributes)
    @title = movie_attributes[:title]
    @vote_average = movie_attributes[:vote_average]
    @runtime = movie_attributes[:runtime]
    @genres = movie_attributes[:genres].map do |genre|
      genre[:name]
    end
    @summary = movie_attributes[:overview]
    @cast = {}
    10.times do |index|
      @cast[cast_attributes[:cast][index][:name]] = cast_attributes[:cast][index][:character]
    end
    @review_count = review_attributes[:total_results]
    @reviews = {}
    @review_count.times do |index|
      @reviews[review_attributes[:results][index][:author]] = review_attributes[:results][index][:author_details][:rating]
    end

    @id = movie_attributes[:id]
    @movie_poster = movie_attributes[:poster_path]
  end
end
