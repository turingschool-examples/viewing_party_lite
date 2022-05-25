class Movie

  attr_reader :title, :vote_average, :id

  def initialize(data)
    # require 'pry'; binding.pry
    @title = data[:title]
    @vote_average = data[:vote_average]
    @id = data[:id]
  end
end
