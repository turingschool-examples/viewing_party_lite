class MovieFacade

  def top20(data = top_movies_data)
  	data.map do |movie_data|
  	  MovieDetail.new(movie_data)
  	end
  end

  def search(keyword)
    search_movies_data(keyword)
    if @first_20[:total_pages] == 0
      "No movies found containing '#{keyword}'"
    else
      data = @first_20[:results]+@second_20[:results]
      data.map do |movie_data|
        MovieDetail.new(movie_data)
      end
    end
  end

  def search_movies_data(keyword)
    @first_20 ||= service.search(keyword)
    @second_20 ||= service.search(keyword, 2)
  end
  def top_movies_data
  	@top_movies_data ||= service.top20
  end

  def details(movie_id)
    # require 'pry'; binding.pry
     # MovieDetail.new(TmdbService.movie_details(movie_id))
     @details ||= service.movie_details(movie_id)

   end

  def service
  	@service ||= TmdbService.new
  end
end
