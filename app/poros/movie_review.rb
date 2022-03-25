class MovieReview
  attr_reader :author,
              :review_content,
              :review_count

  def initialize(movie_data)
    @author = movie_data[:author]
    @review_content = movie_data[:content]
    @review_count = movie_data[:total_results]
    # review_count shows up here but does not work in the view
  end
end
