require 'rails_helper'
require './app/facades/movie_facade.rb'

RSpec.describe MovieFacade do
  let!(:movie_facade) { MovieFacade.new }

  before :each do
    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.7.4'
      }).
    to_return(status: 200, body: json_response, headers: {})
  end

  it 'exists' do
    expect(movie_facade).to be_a(MovieFacade)
  end

  it 'can return movie attributes' do
    movie = MovieFacade.get_movie('238')

    expect(movie.title).to eq('The Godfather')
    expect(movie.runtime).to eq(175)
    expect(movie.vote_average).to eq(8.714)
    expect(movie.vote_count).to eq(17392)
  end
  
  it 'can return the first ten cast members' do
    json_response = File.read('spec/fixtures/cast.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response, headers: {})
    cast = MovieFacade.top_cast('238')
    
    expect(cast.first.name).to eq("Marlon Brando")
  end

  # it 'returns image url' do
  #   json_response = File.read('spec/fixtures/image.json')

  #   stub_request(:get, "https://api.themoviedb.org/3/movie/238/images?api_key=3a8894c032bbd79e5f34c91f45b93378").
  #        with(
  #          headers: {
  #         'Accept'=>'*/*',
  #         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
  #         'User-Agent'=>'Faraday v2.7.4'
  #          }).
  #        to_return(status: 200, body: json_response, headers: {})

  #   image_url = MovieService.image('238')
  # end
end