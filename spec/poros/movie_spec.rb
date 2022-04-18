# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    data = {
      title: 'Batman Begins',
      vote_average: 6.9
    }

    batman = Movie.new(data)

    expect(batman).to be_a Movie
    expect(batman.title).to eq 'Batman Begins'
    expect(batman.vote_average).to eq 6.9
  end
end
