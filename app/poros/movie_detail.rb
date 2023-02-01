class MovieDetail
  attr_reader :title,
              :id,
              :summary,
              :vote_average,
              :vote_count,
              :runtime,
              :genres

  def initialize(response)
    # require 'pry'; binding.pry
    @title = response[:title]
    @id = response[:id]
    @summary = response[:overview]
    @genres = response[:genres]
    @runtime = response[:runtime]
    @vote_average = response[:vote_average]
    @vote_count = response[:vote_count]
  end
end