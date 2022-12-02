class Movie
  attr_reader :id,
              :title,
              :vote_avg,
              :runtime,
              :genres,
              :summary,
              :total_review_count,
              :reviews,
              :cast_members

  def initialize(data)
    @id = data[:id]
    @title = data[:original_title]
    @vote_avg = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    @cast_members = data[:cast]
    @total_review_count = data[:total_results]
    @reviews = data[:results]
  end
end
