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
  
  describe 'review API consumption' do
    before :each do
      json_response_reviews = File.read('spec/fixtures/reviews.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews?api_key=#{ENV['MOVIE_DB_KEY']}")
        .to_return(status: 200, body: json_response_reviews, headers: {})
        
      revs = MovieFacade.reviews('238')
    end
    
    xit 'exists and has attributes' do
      expect(revs).to be_a(Hash)
    end
    
    xit 'can return a count of reviews' do
      expect(revs.count).to eq(2)
    end
    
    xit 'can return the names of reviewers' do
      expect(revs.first.author).to eq("futuretv")
      expect(revs.last.author).to eq("crastana")
    end
    
    xit 'can return review information' do
      expect(revs.first.content).to be_a(String)
    end
  end
end