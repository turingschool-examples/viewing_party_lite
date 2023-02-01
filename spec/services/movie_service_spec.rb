require 'rails_helper'

RSpec.describe MovieService do
  before :each do
    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=3a8894c032bbd79e5f34c91f45b93378").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.7.4'
      }).
    to_return(status: 200, body: json_response, headers: {})
  end

  it 'returns a movie' do
    id = 238
    movie = MovieService.get_movie(id)

    expect(movie).to be_a(Hash)
    expect(movie[:original_title]).to eq('The Godfather')
    expect(movie).to have_key(:id)
  end
end