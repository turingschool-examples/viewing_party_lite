class MovieDetails
  attr_reader :title,
              :vote_average,
              :genre,
              :runtime,
              :summary,
              :cast_members,
              :total_reviews,
              :author

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @genre = data[:genres].map {|genre| genre[:name]}
    @runtime = data[:runtime]
    @summary = data[:overview]
    @cast_members = data[:credits][:cast][(1..10)]
    @total_reviews = data[:reviews][:total_results]
    @author = data[:reviews][:results].map {|author| author[:author_details]}

  end
end
