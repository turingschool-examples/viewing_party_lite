require 'rails_helper'

RSpec.describe MovieDetails do
  before :each do
    @data = { title: 'Mermaid', vote_average: 6, runtime: 105, genres: %w[Comedy Romance],
              overview: 'It mostly sucks' }
    @movie = MovieDetails.new(@data)
  end
  it 'exists and has attributes' do
    expect(@movie).to be_a MovieDetails
    expect(@movie.title).to eq('Mermaid')
    expect(@movie.vote_average).to eq(6)
    expect(@movie.runtime).to eq(105)
    expect(@movie.genres[0]).to eq('Comedy')
    expect(@movie.genres[1]).to eq('Romance')
    expect(@movie.overview).to eq('It mostly sucks')
  end
  it 'can return runtime as a string in x hrs x min format' do
    expect(@movie.formatted_runtime).to eq('1 hr 45 min')
  end
  it 'can return a formatted list of the genres array' do
    expect(@movie.genre_list).to eq('Comedy, Romance')
  end
end
