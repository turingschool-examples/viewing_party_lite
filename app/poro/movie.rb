class Movie

  attr_reader :id, :title, :overview, :poster_path, :release_date, :vote_average, :popularity

  def initialize(data_1, data_2, data_3)
    @id = data_1[:id]
    @title = data_1[:title]
    @vote_average = data_1[:vote_average]
    @runtime = data_1[:runtime]
    @genres = []
    @overview = data_1[:overview]
    @cast = []
    @review_count = data_3.count
    @reviews = []
  end

  def genres(data_1)
    data_1[:genres].each do |genre|
      @genres << genre[:name]
    end
  end

  def cast(data_2)
    data_2.each do |cast_member|
      @cast << cast_member[:name], cast_member[:character]
    end
  end

  def reviews(data_3)
    data_3.each do |review|
      @reviews << review[:author], review[:content]
    end
  end

end
