class MoviePoro
  attr_reader :id, :title, :average_rating

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @average_rating =  data[:vote_average]
  end
end
