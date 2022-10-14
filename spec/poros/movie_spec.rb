# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  before :each do
    attributes = { title: 'The Godfather', vote_average: '8.7', id: 1939 }
    @movie = Movie.new(attributes)
  end

  it 'exists' do
    expect(@movie).to be_an_instance_of(Movie)
  end

  it 'has a title' do
    expect(@movie.title).to eq('The Godfather')
  end

  it 'has a vote average' do
    expect(@movie.vote_average).to eq('8.7')
  end

  it 'has an id' do
    expect(@movie.id).to eq(1939)
  end
end
