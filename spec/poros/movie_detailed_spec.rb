require 'rails_helper'

RSpec.describe MovieDetailed do
  before :each do
    VCR.use_cassette('movie-detailed') do
      @movie = MoviesFacade.details(438148)
    end
  end

  it 'exists' do
    expect(@movie).to be_a(MovieDetailed)
  end

  it 'has a title' do
    expect(@movie.title).to eq('Minions: The Rise of Gru')
  end

  it 'has a vote average' do
    expect(@movie.vote_average).to eq(7.566)
  end

  it 'has a runtime' do
    expect(@movie.runtime).to eq(87)
  end

  it 'has genres' do
    expect(@movie.genres).to include('Animation', 'Family')
    expect(@movie.genres).to be_an(Array)
  end

  it 'has a summary' do
    expect(@movie.summary).to include("A fanboy of a supervillain")
  end

  it 'has the first 10 cast members characters and names' do
    expect(@movie.cast.first).to eq('Steve Carell as Gru (voice)')
    expect(@movie.cast.count).to eq(10)
  end

  it 'has the count of total reviews' do
    expect(@movie.reviews.count).to eq(4)
  end

  it 'has each review with the author of that review' do
    expect(@movie.reviews.first[:author]).to eq('CinemaSerf')
    expect(@movie.reviews.first[:content]).to include("Eleven year old 'Gru\" is asked by his school teacher")
  end
end