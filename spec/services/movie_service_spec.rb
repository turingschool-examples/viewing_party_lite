require 'rails_helper'

RSpec.describe 'Movie Service' do
  it 'retrieves movie data through search', :vcr do
    parsed_json = MovieService.search('Arrival')

    expect(parsed_json[:results]).to be_a(Array)
    expect(parsed_json[:results][0]).to have_key(:vote_average)
  end

  it 'retrieves top rated movies', :vcr do
    parsed_json = MovieService.top_rated

    expect(parsed_json[:results]).to be_a(Array)
    expect(parsed_json[:results][0]).to have_key(:vote_average)
  end

  it 'retrieves movie details', :vcr do
    parsed_json = MovieService.details(261)

    expect(parsed_json).to be_a(Hash)
    expect(parsed_json).to have_key(:title)
    expect(parsed_json).to have_key(:overview)
  end

  it 'retrieves movie cast', :vcr do
    parsed_json = MovieService.cast(261)

    expect(parsed_json[:cast]).to be_a(Array)
    expect(parsed_json[:cast][0]).to have_key(:name)
  end

  it 'retrieves movie reviews', :vcr do
    parsed_json = MovieService.reviews(550)

    expect(parsed_json[:results]).to be_a(Array)
    expect(parsed_json[:results][0]).to have_key(:author)
    expect(parsed_json[:results][0]).to have_key(:content)
    expect(parsed_json).to have_key(:total_results)
  end
end
