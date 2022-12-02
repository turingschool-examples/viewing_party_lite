# frozen_string_literal: true

class MovieReviews
  attr_reader :results

  def initialize(attributes)
    @results = attributes[:results]
  end

  def reviews
    @results.map { |result| "#{result[:author]}: #{result[:content]}" }
  end
end
