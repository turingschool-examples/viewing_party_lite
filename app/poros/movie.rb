class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :overview,
              :genres,
              :cast,
              :reviews

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = sanitize_genres(data[:genres])
    @cast = sanitize_cast(data[:credits])
    @overview = data[:overview]
    @reviews = sanitize_reviews(data[:reviews])
  end

  def sanitize_genres(data)
    return if data.nil?
    data.map do |genre|
      genre[:name]
    end
  end

  def sanitize_cast(data)
    return if data.nil?
      data[:cast][0..9].map do |cast|
        { name: cast[:name], character: cast[:character] }
      end
  end

  def sanitize_reviews(data)
    return if data.nil?
      data[:results].map do |review|
        { author: review[:author], content: review[:content] }
      end
  end
end