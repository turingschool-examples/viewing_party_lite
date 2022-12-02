require './app/services/movies_service'

class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    if params[:q] == "top_rated"
      data = MoviesService.new.search("top_rated")
      movies = data[:results][0..19]
      @movies = movies.pluck(:original_title, :id, :vote_average)
    else
      data = MoviesService.new.keyword_search(params[:q])
      movies = data[:results][0..19]
      @movies = movies.pluck(:original_title, :id, :vote_average)
    end
  end

  def show
    @user = User.find(params[:user_id])
    movie_data = MoviesService.new.search(params[:id])
    @title = movie_data[:original_title]
    @vote = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @poster_path = movie_data[:poster_path]
    @genre = movie_data[:genres]
    @summary = movie_data[:overview]
    @movie_cast = MoviesService.new.cast_list(params[:id])[:cast][0..9].pluck(:name, :character)
    movie_review_data = MoviesService.new.reviews(params[:id])
    @review_count = movie_review_data[:total_results]
    @movie_reviews = movie_review_data[:results].pluck(:author, :author_details)
  end
end