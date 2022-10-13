class Cast

  attr_reader :id, :cast, :character

  def initialize(cast_api_data)
    @id = cast_api_data[:cast_id]
    @name = cast_api_data[:name]
    @character = cast_api_data[:character]
  end
end