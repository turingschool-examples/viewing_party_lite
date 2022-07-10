class Reviews
  attr_reader :total_results,
              :paired_reviews

  def initialize(data)
    @total_results = data[:total_results]
    @paired_reviews = data[:results].map { |x| { author: x[:author], content: x[:content]} }
  end
end
