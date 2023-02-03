class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :overview

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @credits = data[:credits]
    @overview = data[:overview]
    @reviews = data[:reviews]
  end

  def genres
    @genres.map do |genre|
      genre[:name]
    end
  end

  def cast
    return unless @credits
      @credits[:cast][0..9].map do |cast|
        { name: cast[:name], character: cast[:character] }
      end
  end

  def reviews
    return unless @reviews
      @reviews[:results].map do |review|
        { author: review[:author], content: review[:content] }
      end
  end
end