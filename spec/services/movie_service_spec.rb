require 'rails_helper'

RSpec.describe MovieService do
  it 'data from API' do
    response = MovieService.get_data('movie/top_rated')

    expect(response).to be_a(Hash)
    expect(response[:results]).to be_an(Array)
    expect(response).to have_key(:page)
    expect(response).to have_key(:results)
    expect(response).to have_key(:total_pages)
    expect(response).to have_key(:total_results)
  end

  it 'gets top rated movies' do
    response = MovieService.get_data('movie/top_rated')

    response[:results].each do |movie|
      expect(movie).to have_key(:id)
      expect(movie).to have_key(:vote_average)
      expect(movie).to have_key(:original_title)
    end
  end
end
