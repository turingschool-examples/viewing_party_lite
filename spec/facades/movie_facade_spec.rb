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
  
  describe 'credits API consumption' do
    before :each do
      json_response = File.read('spec/fixtures/cast.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['MOVIE_DB_KEY']}")
        .to_return(status: 200, body: json_response, headers: {})
        
      @cast = MovieFacade.top_cast('238')
    end
    
    it 'can return the first ten cast members' do
      expect(@cast.first.name).to eq("Marlon Brando")
    end
  end
  
  describe 'review API consumption' do
    before :each do
      json_response_reviews = File.read('spec/fixtures/reviews.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews?api_key=#{ENV['MOVIE_DB_KEY']}")
        .to_return(status: 200, body: json_response_reviews, headers: {})
        # binding.pry
      # @revs = MovieFacade.all_reviews('238')
      @all = MovieFacade.all_reviews('238')
      @review1 = MovieFacade.reviews('238').first
      @review2 = MovieFacade.reviews('238').last
      # binding.pry
    end
    
    it 'exists and has attributes' do
      expect(@all).to be_a(Array)
    end
    
    it 'can return a count of reviews' do
      expect(@all.count).to eq(2)
    end
    
    it 'can return the names of reviewers' do
      expect(@review1.author).to eq("futuretv")
      expect(@review2.author).to eq("crastana")
    end
    
    it 'can return the comment id' do
      expect(@review1.review_id).to eq("5346fa840e0a265ffa001e20")
      expect(@review2.review_id).to eq("62d5ea2fe93e95095cbddefe")
    end
    
    it 'can return review rating' do
      expect(@review1.rating).to eq(10.0)
      expect(@review2.rating).to eq(10.0)
    end
    
    it 'can return review information' do
      expect(@review1.content).to be_a(String)
      expect(@review2.content).to be_a(String)
    end
  end
end