class MovieDetail
  attr_reader :id,
              :title,
              :runtime,
              :genres,
              :summary,
              :vote_average,
              :cast,
              :reviews,
              :review_count,
              :poster_path

  def initialize(movie_details, movie_cast, movie_reviews)
    @id = movie_details[:id]
    @title = movie_details[:title]
    @runtime = (movie_details[:runtime].to_f / 60).round(2)
    @vote_average = movie_details[:vote_average]
    @genres = all_genre(movie_details)
    @summary = movie_details[:overview]
    @cast = cast_details(movie_cast)
    @reviews = review_details(movie_reviews)
    @review_count = movie_reviews[:results].count
  end

  def all_genre(movie_details)
    movie_details[:genres].map { |genre| genre[:name] }
  end

  def cast_details(movie_cast)
    hash = {}
    movie_cast[:cast].each { |actor| hash[actor[:name]] = actor[:character] }

    hash.first(10)
  end

  def review_details(movie_reviews)
    hash = {}
    movie_reviews[:results].each { |review| hash[review[:author]] = review[:content] }
    hash
  end
end
