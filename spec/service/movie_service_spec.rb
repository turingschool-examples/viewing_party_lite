require 'rails_helper'

RSpec.describe MovieService do
  it 'exists' do

    ms = MovieService.top_rated

    expect(ms).to be_a(Hash)
  end
end