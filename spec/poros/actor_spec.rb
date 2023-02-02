require 'rails_helper'
require './app/services/movie_service'

RSpec.describe Actor do
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

  it 'exists and has attributes' do
    id = 238
    cast = MovieFacade.top_cast(id)
    actor = cast.first
    
    expect(actor).to be_an(Actor)
    expect(actor.name).to eq('Marlon Brando')
    expect(actor.character).to eq('Don Vito Corleone')
    expect(actor.id).to eq(3084)
  end
end