class MovieFacade

  def self.top20
    TmdbService.top20.map do |movie_data|
      MovieDetail.new(movie_data)
    end
  end

  def self.search(keyword)
    search_movies_data(keyword)
    if @first_20[:total_results] == 0
      "No movies found containing '#{keyword}'"
    else
      data = @first_20[:results] + @second_20[:results]
        data.map do |movie_data|
        MovieDetail.new(movie_data)
      end
    end
  end

  def self.search_movies_data(keyword)
    @first_20 ||= TmdbService.search(keyword)
    @second_20 ||= TmdbService.search(keyword, 2)
  end

  def self.movie_data(movie_id)
    data = Hash.new
    data[:movie_details] = movie_details(movie_id)
    data[:movie_cast] = movie_cast(movie_id)
    data[:movie_reviews] = movie_reviews(movie_id)
    data
  end

  def self.movie_details(movie_id)
    MovieDetail.new(TmdbService.movie_details(movie_id))
  end

  def self.movie_cast(movie_id)
    TmdbService.movie_cast(movie_id)[:cast].map do |data|
      Cast.new(data)
    end
  end

  def self.movie_reviews(movie_id)
    TmdbService.movie_review(movie_id)[:results].map do |data|
      Review.new(data)
    end
  end
end
