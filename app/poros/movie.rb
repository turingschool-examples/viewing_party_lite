class Movie
  attr_reader :id,
              :title,
              :vote_avg,
              :run_time,
              :genres,
              :summary,
              # :cast_members,
              :total_review_count

  # :review_author,
  # :review_description

  def initialize(data)
    @id = data[:id]
    @title = data[:original_title]
    @vote_avg = data[:vote_average]
    @run_time = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    # @cast_members = data[:cast].map { |member| (member[:name] => member[:character]) } #not right
    @total_review_count = data[:total_results]
    # @review_author = data[:results].map { |review| (review[:author] => member[:content]) }
  end

  # def genres
  #   data[]
  # end
end

