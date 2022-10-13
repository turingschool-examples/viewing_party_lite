require 'rails_helper'

RSpec.describe MovieFacade do
  describe ".top_1_through_20_movies" do
    it 'should have 20 movie objects' do
      VCR.use_cassette('.top_1_through_20_movies') do
        array = MovieFacade.top_1_through_20_movies

        expect(array).to be_a Array
        expect(array.length).to eq 20
        expect(array.first).to be_a Movie
      end
    end
  end

  describe '.top_21_through_40_movies' do
    it 'should have 20 movie objects' do
      VCR.use_cassette('.top_21_through_40_movies') do
        array = MovieFacade.top_21_through_40_movies

        expect(array).to be_a Array
        expect(array.length).to eq 20
        expect(array.first).to be_a Movie
      end
    end
  end

  describe '.top_40_movies' do
    it 'should have 40 movie objects' do
      VCR.use_cassette('.top_40_movies') do
        array = MovieFacade.top_40_movies

        expect(array).to be_a Array
        expect(array.length).to eq 40
        expect(array.first).to be_a Movie
      end
    end
  end

  describe '.search(search_params)' do
    it 'should search api for partial and complete matches' do
      VCR.use_cassette('.search') do
        array = MovieFacade.search_first_40("fight club")

        expect(array).to be_a Array
        expect(array.length).to be <= 40
        expect(array.first).to be_a Movie
      end
    end
  end
end