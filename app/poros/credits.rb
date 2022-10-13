class Credits

  attr_reader :cast_info
  
  def initialize(api)
    @cast_info = api[:cast]
  end

  def cast_names
    @cast_info.map do |credit|
      credit[:name]
    end.slice(0, 10)
  end
end