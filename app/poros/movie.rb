class Movie
  attr_reader :id,
              :title,
              :vote_avg,
              :run_time,
              :genres,
              :summary,
              :total_review_count,
              :reviews,
              :cast_members

  # :review_author,
  # :review_description

  def initialize(data)
    @id = data[:id]
    @title = data[:original_title]
    @vote_avg = data[:vote_average]
    @run_time = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    @cast_members = data[:cast]
    @total_review_count = data[:total_results]
    @reviews = data[:results]

  end 
  # def genres
  #   data[]
  # end
end
