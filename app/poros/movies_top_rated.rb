class MoviesTopRated
  attr_reader :results

  def initialize(api)
    @results = api[:results]
  end

  def titles
    @results.map { |result| result[:title] }
  end
end