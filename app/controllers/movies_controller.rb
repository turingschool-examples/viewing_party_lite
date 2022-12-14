
require './app/services/movies_service'

class MoviesController < ApplicationController
  before_action :current_user
  
  def index
    @user = current_user
    data = if params[:q] == 'top_rated'
             MoviesService.new.search('top_rated')
           else
             MoviesService.new.keyword_search(params[:q])
           end
    movies = data[:results][0..19]
    @movies = movies.pluck(:original_title, :id, :vote_average)
  end

  def show
    @user = current_user
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

# private
#   def require_user
#     redirect_to '/dashboard/movies' unless current_user
#   end
end
