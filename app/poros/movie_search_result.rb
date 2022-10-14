class MovieSearchResult
  attr_reader :id, :title, :vote_average

  def initialize(search_result)
    @id = search_result[:id]
    @title = search_result[:title]
    @vote_average = search_result[:vote_average]
  end
end