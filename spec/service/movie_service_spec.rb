require 'rails-helper'

RSpec.describe MovieService do
  it 'exists' do
    ms = MovieService.movies

    expect(ms).to be_a(Array)
  end
end