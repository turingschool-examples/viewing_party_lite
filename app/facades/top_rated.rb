class TopRated 
  def service 
    MovieService.new
  end

  def movies
    service.top_rated.map do |data|
      Movies.new(data)
    end.take(20)
  end
end 