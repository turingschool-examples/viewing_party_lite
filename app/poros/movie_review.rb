class MovieReview 
  attr_reader :results,
              :total_results

  def initialize(movie_review_data)
    @results = movie_review_data[:results]
    @total_results = movie_review_data[:total_results]
  end

  def review_with_author
    @results.map do |review|
      "Author: #{review[:author]} Content: #{review[:content]}"
    end.join('')
  end
end