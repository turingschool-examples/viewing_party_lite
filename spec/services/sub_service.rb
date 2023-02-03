require 'rails_helper'

RSpec.describe MovieService do
  it 'can return cast data' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/348/credits?api_key=#{ENV['tmdb_api_key']}&language=en")
      .to_return(status: 200,
                 body: File.read('spec/fixtures/alien_credits.json'),
                 headers: {})

    response = SubService.ping(348, '/3/movie/348/credits')

    expect(response).to have_key(:cast)
    expect(response[:cast]).to be_a Array
    response[:cast].each do |cast|
      expect(cast[:name]).to be_a String
      expect(cast[:character]).to be_a String
    end
  end

  it 'can return review data' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/348/reviews?api_key=#{ENV['tmdb_api_key']}&language=en")
      .to_return(status: 200,
                 body: File.read('spec/fixtures/alien_reviews.json'),
                 headers: {})

    response = SubService.ping(348, '/3/movie/348/reviews')

    expect(response).to have_key(:results)
    expect(response[:results]).to be_a Array
    response[:results].each do |review|
      expect(review[:author]).to be_a String
      expect(review[:content]).to be_a String
    end
  end
end
