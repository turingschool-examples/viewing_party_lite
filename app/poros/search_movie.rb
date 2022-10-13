class SearchMovie
  attr_reader :id, :title, :vote_average

  def initialize(search_data)
    @id = search_data[:id]
    @title = search_data[:title]
    @vote_average = search_data[:vote_average]
  end
end