require 'rails_helper'
require './app/facades/movies/show_facade'

RSpec.describe Movies::MovieFacade do
  let!(:movie_facade) { Movies::MovieFacade.new }
  before :each do
    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.7.4'
      }).
    to_return(status: 200, body: json_response, headers: {})
  end

  it 'exists' do
    expect(movie_facade).to be_a(Movies::MovieFacade)
  end

  it 'can return the title' do
    movie = movie_facade.get_title('238')

    expect(movie).to eq('The Godfather')
  end
end