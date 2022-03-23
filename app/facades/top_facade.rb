require './app/poros/review'

class TopFacade
  def initialize
    @top_rated = []
    MovieService.top_rated[:results].each do |movie|

      @top_rated << Movie.new()
    end
  end
end
