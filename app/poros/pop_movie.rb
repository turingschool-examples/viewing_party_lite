class PopMovie
  attr_reader :title,
              :vote_average

  def initialize(data)
    @title = data[:date]
    @name = data[:name]
  end
end
