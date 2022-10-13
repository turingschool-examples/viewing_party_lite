class MovieFacade

  def self.top_rated
    MovieService.top_rated[:results].map do |data|
      MovieResult.new(data)
    end
  end
end
