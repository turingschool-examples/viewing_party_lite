class Movie
  attr_reader :id, :title, :vote_average, :summary, :genre, :runtime, :cast, :review_count, :reviews

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    # @vote_average = data[:vote_average]
    # @summary = data[:overview]
    # @genre = genre_parse(data[:genres])
    # @runtime = format_time(data[:runtime])
    #
    # @cast = cast_parse(cast[:cast][0..9])
    #
    # @review_count = reviews[:total_results]
    # @reviews = review_parse(reviews[:results])
  end

  def genre_parse(data)
    genre = []
    data.each do |hash|
      genre << hash[:name]
    end
    genre.join(", ").split(" ")
  end

  def format_time(data)
    "#{data / 60}h #{data % 60}min"
  end

  def cast_parse(cast_data)
    cast = []
    cast_data.each do |hash|
      cast << "#{hash[:name]} as #{hash[:character]}"
    end
    cast
  end

  def review_parse(review_data)
    reviews = []
    review_data.each do |hash|
      reviews << {author: hash[:author_details][:username], review: hash[:content]}
    end
    reviews
  end

end
