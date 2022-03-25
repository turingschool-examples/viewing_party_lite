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

  def initialize(movie_details, movie_cast, _movie_reviews)
    @id = movie_details[:id]
    @title = movie_details[:title]
    @runtime = (movie_details[:runtime].to_f / 60).round(2)
    @vote_average = movie_details[:vote_average]
    @genres = all_genre(movie_details)
    @summary = movie_details[:overview]
    @cast = cast_details(movie_cast)
  end

  def all_genre(movie_details)
    movie_details[:genres].map { |genre| genre[:name] }
  end

  def cast_details(movie_cast)
    hash = {}
    movie_cast[:cast].each do |actor|
      hash[actor[:name]] = actor[:character]
    end
    hash.first(10)
  end
end
