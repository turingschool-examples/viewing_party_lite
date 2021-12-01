class PopMovie
  attr_reader :title,
              :vote_average

  def initialize(data)
    @title = data[:title]
    @name = data[:vote_average]
  end
end

#put movie id
