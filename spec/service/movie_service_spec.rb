require 'rails_helper'



RSpec.describe MovieService do
  it 'exists' do
    ms = MovieService.top_rated

    expect(ms).to be_a(Hash)
  end

  it '#movies_by_keyword' do
    results = MovieService.movies_by_keyword("Fight")
  require 'pry'; binding.pry 
    expect(results).to be_a(Hash)
  end
end