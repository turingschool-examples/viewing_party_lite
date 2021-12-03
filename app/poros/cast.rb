class Cast
  attr_reader :name,
              :role

  def initialize(data)
    # require "pry"; binding.pry
    @name = data[:name]
    @role = data[:character]
  end
end
