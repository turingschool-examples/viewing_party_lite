class Movie
  attr_reader :title
  def initialize(data)
    @title = data[:title]
    binding.pry
    # @summary = data[:summary]
    # @cast = data[:cast]
  end
end
