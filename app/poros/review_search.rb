require './app/poros/review'
require './app/services/tmdb_service'

class ReviewSearch
  def reviews(id)
    data_array = service.movie_reviews(id)[:results]
    data_array.select { |data| data[:author] != "" }.map do |data| 
      Review.new(data)
    end
  end

  def service
    TmdbService.new
  end
end