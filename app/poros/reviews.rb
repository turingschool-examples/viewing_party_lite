class Reviews
  attr_reader :results, :total_results

  def initialize(data)
    @results = data[:results]
    @total_results = data[:total_results]
  end
end
