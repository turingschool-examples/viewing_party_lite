class MovieFacade
  def self.top_40
    json_array = MovieService.top_movies
    json_array.map do |page_hash|
      page_hash[:results].map do |movie_data|
        Movie.new(movie_data)
      end
    end.flatten
  end

  def self.search_by_keyword(keyword)
    json_array = MovieService.movie_search(keyword)
    if !json_array.first[:errors].present?
      json_array.map do |page_hash|
        page_hash[:results].map do |movie_data|
          Movie.new(movie_data)
        end
      end.flatten
    end
  end

  def self.find_movie(id)
    json = MovieService.movie_lookup(id)
    Movie.new(json)
  end
end
