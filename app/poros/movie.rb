# frozen_string_literal: true

class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :overview,
              :image_path

  def initialize(movie_params)
    @id = movie_params[:id]
    @title = movie_params[:original_title]
    @vote_average = movie_params[:vote_average]
    @runtime = movie_params[:runtime]
    @genres = movie_params[:genres]
    @overview = movie_params[:overview]
    @cast = movie_params[:cast].try(:first, 10)
    @reviews = movie_params[:results]
    @image_path = base_image_uri + movie_params[:poster_path]
  end

  def genres
    @genres.map do |genre|
      genre[:name]
    end.join(', ')
  end

  def review_total
    @reviews.length
  end

  def cast
    @cast.map do |cast_member|
      actor = OpenStruct.new
      actor.name = cast_member[:name]
      actor.character = cast_member[:character]
      actor
    end
  end

  def reviews
    @reviews.map do |review|
      critic = OpenStruct.new
      critic.author = review[:author]
      critic.content = review[:content]
      critic
    end
  end

  private

  def base_image_uri
    'https://image.tmdb.org/t/p/w500/'
  end
end
