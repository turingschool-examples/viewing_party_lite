class CastFacade
  def self.get(id)
    path = "/3/movie/#{id}/credits"
    data = SubService.ping(id, path)

    cast = data[:cast].first(10)

    cast.map do |cast_data|
      Cast.new(cast_data)
    end
  end
end
