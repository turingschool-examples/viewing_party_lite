# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attrs = {
      id: 550,
      title: 'Fight Club',
      runtime: 139,
      vote_average: 8.428,
      poster_path: '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg'
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.id).to eq(550)
    expect(movie.title).to eq('Fight Club')
    expect(movie.runtime).to eq(139)
    expect(movie.vote_average).to eq(8.428)
    expect(movie.poster_path).to eq('/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg')
  end
end
