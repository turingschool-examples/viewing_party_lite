require 'rails_helper'

RSpec.describe MovieService do
  it 'can return movie data' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/348?api_key=#{ENV['tmdb_api_key']}&language=en&movie_id=348")
      .to_return(status: 200,
                 body: File.read('spec/fixtures/alien_details.json'),
                 headers: {})
    response = MovieService.ping('/3/movie/348', { api_key: ENV['tmdb_api_key'],
                                                   language: 'en',
                                                   movie_id: 348 })

    expect(response[:title]).to be_a String
    expect(response[:vote_average]).to be_a Float
    expect(response[:runtime]).to be_a Integer
    expect(response[:genres]).to be_a Array
    expect(response[:genres][0]).to be_a Hash
    expect(response[:genres][0][:name]).to be_a String
    expect(response[:overview]).to be_a String
    expect(response[:id]).to be_a Integer
  end

  it 'can return discover movie data' do
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_api_key']}&language=en&query=Alien")
        .to_return(status: 200,
                   body: File.read('spec/fixtures/tmdb_search_title_response.json'),
                   headers: {})

    response = MovieService.ping('/3/search/movie', { api_key: ENV['tmdb_api_key'],
      language: 'en',
      query: 'Alien' })

    expect(response).to have_key(:results)
    expect(response[:results]).to be_a Array
    response[:results].each do |result|
      expect(result[:title]).to be_a String
      expect(result[:vote_average]).to be_a Numeric
      expect(result[:id]).to be_a Integer
    end
  end
end
