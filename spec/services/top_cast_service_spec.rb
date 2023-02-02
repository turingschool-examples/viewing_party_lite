require 'rails_helper'

RSpec.describe TopCastService do
  before :each do
    json_response = File.read('spec/fixtures/cast.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['MOVIE_DB_KEY']}").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.7.4'
      }).
    to_return(status: 200, body: json_response, headers: {})
  end
  
  it 'can return the first ten actors in a movie' do
    id = 238
    cast = MovieFacade.top_cast(id)
    
    expect(cast).to be_an(Array)
    expect(cast.count).to eq(10)
  end
end
