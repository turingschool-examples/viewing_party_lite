class Credits
  attr_reader :name

  def initialize(api)
    @name = api[:name]
  end
end
