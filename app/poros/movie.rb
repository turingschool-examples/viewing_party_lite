class Movie
  attr_reader :title, 
              :vote_average,
              :runtime,
              :genre,
              :summary,
              :cast,
              :reviews,
              :image_link
              
  def initialize(data)
      @title = data[:title]
      @vote_average = data[:vote_average]
      @runtime = data[:runtime]
      @genre = data[:genres].map { |g| g[:name] }
      @summary = data[:overview]
      @cast = data[:credits][:cast].take(10).map { |cast_mem| CastMember.new(cast_mem)}
      # @cast = data[:credits][:cast].take(10).map { |cast_mem| [cast_mem.name, cast_mem.character]}
      @reviews = data[:reviews][:results].map { |review| Review.new(review) }
      # @reviews = data[:reviews][:results].map { |review| [review[:author], review[:content]] }
      @image_link = data[:images][:posters].first[:file_path]
  end
end