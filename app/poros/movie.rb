class Movie
  attr_reader :vote_average,
              :original_title
  def initialize(data)
    @vote_average = data[:vote_average]
    @original_title = data[:original_title]
  end
end
