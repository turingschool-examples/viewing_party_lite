# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieDetails do
  before :each do
    @data = { title: 'Mermaid', vote_average: 6, runtime: 105, genres: [{ id: 80, name: 'Crime' }, { id: 18, name: 'Drama' }],
              overview: 'It mostly sucks' }
    @movie = MovieDetails.new(@data)
  end
  it 'exists and has attributes' do
    expect(@movie).to be_a MovieDetails
    expect(@movie.title).to eq('Mermaid')
    expect(@movie.vote_average).to eq(6)
    expect(@movie.runtime).to eq(105)
    expect(@movie.genres.first[:name]).to eq('Crime')
    expect(@movie.genres.last[:name]).to eq('Drama')
    expect(@movie.overview).to eq('It mostly sucks')
  end
  it 'can return runtime as a string in x hrs x min format' do
    expect(@movie.formatted_runtime).to eq('1 hr 45 min')
  end
  it 'can return a formatted list of the genres hash' do
    expect(@movie.genre_list).to eq('Crime, Drama')
  end
end
