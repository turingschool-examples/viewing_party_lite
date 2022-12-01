# frozen_string_literal: true

class MovieReviews
  def initialize(attributes)
    @results = attributes[:results]
  end

  def reviews
    @results.map { |result| "#{result[:author]}: #{result[:content]}" }
  end
end
