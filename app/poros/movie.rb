class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :genres,
              :summary,
              :cast, 
              :reviews,
              :image_path,
              :runtime

  def initialize(movie_details, movie_images, movie_credits, movie_reviews)
    @id = movie_details[:id]
    @title = movie_details[:title]
    @vote_average = movie_details[:vote_average]
    @runtime = movie_details[:runtime]
    @genres = movie_details[:genres].map{ |genre| genre[:name] }
    @summary = movie_details[:overview]
    @cast = movie_credits[:cast][0..9].map do |cast_member|
      {name: cast_member[:name], character: cast_member[:character]}
    end
    @reviews = movie_reviews[:results].map do |review|
      {author: review[:author], content: review[:content]}
    end
    @image_path = nil
    if movie_images[:posters].first
      @image_path = "http://image.tmdb.org/t/p/w500" + movie_images[:posters].first[:file_path]
    end
  end
end