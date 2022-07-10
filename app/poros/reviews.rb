class Reviews
  attr_reader :total_results,
              :paired_reviews

  def initialize(data)
    # @author = data[:results].collect { |result| result[:author] }
    # @content = data[:results].collect { |result| result[:content] }
    @total_results = data[:total_results]
    @paired_reviews = data[:results].map { |x| { author: x[:author], content: x[:content]} }
  end
end
