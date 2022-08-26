# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attrs = {
      id: 2,
      title: 'Something Borrowed',
      vote_average: 4.5,
      runtime: 112
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a(Movie)
    expect(movie.id).to eq(2)
    expect(movie.title).to eq('Something Borrowed')
    expect(movie.runtime).to eq(112)
  end
end
