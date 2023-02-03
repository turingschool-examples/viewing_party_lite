require 'rails_helper'

RSpec.describe MovieCredit do 
  before :each do 
    response = File.read('./spec/fixtures/green_mile/credits_response.json')
    @data = JSON.parse(response, symbolize_names: true)
  end

  it 'exists and has attributes' do 
    movie = MovieCredit.new(@data)

    expect(movie).to be_an_instance_of(MovieCredit)
    expect(movie.cast).to be_a Array
  end

  describe 'find_actor_name_and_character' do 
    it 'can find the name and character for each cast member' do 
      movie = MovieCredit.new(@data)

      expect(movie.find_actor_name_and_character).to include('Tom Hanks as Paul Edgecomb')
      expect(movie.find_actor_name_and_character).to include("Sam Rockwell as 'Wild Bill' Wharton")
    end
  end

  describe 'top_10_credits' do 
    it 'will limit the cast to the first 10' do 
      movie = MovieCredit.new(@data)

      expect(movie.top_10_credits.count).to eq(10)
      expect(movie.find_actor_name_and_character).to_not include("Patricia Clarkson as Melinda Moores")
    end
  end
end