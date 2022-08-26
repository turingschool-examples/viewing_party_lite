class Movie

  attr_reader :id, :title, :vote_average, :runtime, :genres, :overview, :cast, :review_count, :reviews

  def initialize(data_1, data_2, data_3)
    @id = data_1[:id]
    @title = data_1[:title]
    @vote_average = data_1[:vote_average]
    @runtime = data_1[:runtime]
    @genres = data_1[:genres].map {|genre| genre[:name]}
    @overview = data_1[:overview]
    @cast = data_2.map {|cast_member| "#{cast_member[:name]} as #{cast_member[:character]}"}
    @review_count = data_3.count
    @reviews = data_3.map {|review| "Author: #{review[:author]} Review: #{review[:content]}"}
  end

end
