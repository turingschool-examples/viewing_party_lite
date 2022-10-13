class Reviews
  attr_reader :results

  def initialize(api)
    @results = api[:results]
  end
end
