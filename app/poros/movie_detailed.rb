class MovieDetailed < Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :summary,
              :attributes

  def initialize(attributes)
    super
    @runtime = attributes[:runtime]
    @summary = attributes[:overview]
    @attributes = attributes
  end

  def genres
    @attributes[:genres].map do |genre|
      genre[:name]
    end
  end

  def cast
    @attributes[:credits][:cast].first(10).map do |member|
      "#{member[:name]} as #{member[:character]}"
    end
  end

  def reviews
    @attributes[:reviews][:results].map do |review|
      { author: review[:author], content: review[:content] }
    end
  end

  def hours_and_minutes
    hours = @runtime / 60
    minutes = @runtime % 60
    "#{hours}hr #{minutes}min"
  end

  def poster_path
    "https://image.tmdb.org/t/p/w500#{attributes[:poster_path]}"
  end
end
