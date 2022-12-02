# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  before(:each) do
    attrs = {
      id: 550,
      title: 'Fight Club',
      vote_average: 8.428,
      overview: 'A ticking-time-bomb insomniac...',
      runtime: 139,
      genres: 'Drama, Thriller, Comedy',
      poster_path: '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg'
    }
    @movie = Movie.new(attrs)
  end

  it 'exists' do
    expect(@movie).to be_a Movie
    expect(@movie.id).to eq(550)
    expect(@movie.title).to eq('Fight Club')
    expect(@movie.vote_average).to eq(8.428)
    expect(@movie.overview).to eq('A ticking-time-bomb insomniac...')
    expect(@movie.minutes).to eq(139)
    expect(@movie.genres).to eq('Drama, Thriller, Comedy')
    expect(@movie.poster_path).to eq('/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg')
  end

  describe '#runtime' do
    it 'formats the runtime to show as hours and minutes' do
      expect(@movie.runtime).to eq('2hr 19min')
    end
  end
end
