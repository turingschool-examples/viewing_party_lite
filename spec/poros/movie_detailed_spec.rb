require 'rails_helper'

RSpec.describe 'Movie POROS' do
  it 'has to do what I say', :vcr do
    @details = MoviesService.movie_details(238)
    @credits = MoviesService.movie_credits(238)
    @reviews = MoviesService.movie_reviews(238)
    @movie_data = @details.merge(@credits, @reviews)

    @movie = MovieDetailed.new(@movie_data)

    expect(@movie).to be_a MovieDetailed
    expect(@movie.title).to eq('The Godfather')
    expect(@movie.vote_average).to eq(8.715)
    expect(@movie.runtime).to eq(175)
    expect(@movie.summary).to include('Spanning the years 1945 to 1955')
    expect(@movie.genres).to eq(%w[Drama Crime])
    expect(@movie.cast[0]).to include('Marlon Brando')
    expect(@movie.reviews[0][:content]).to include('greatest ever made')
    expect(@movie.hours_and_minutes).to eq('2hr 55min')
  end
end
