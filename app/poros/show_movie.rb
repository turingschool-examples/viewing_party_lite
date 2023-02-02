class ShowMovie
  attr_reader :title, :vote_average, :runtime
  def initialize(movie_information)
    @title = movie_information[:title]
    @vote_average = movie_information[:vote_average]
    @runtime = time_conversion(movie_information[:runtime])
  end

  def time_conversion(minutes)
    hours = minutes / 60
    rest = minutes % 60
    return "#{hours}:#{rest}" 
  end
end