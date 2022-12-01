require 'rails_helper'

RSpec.describe 'Movies Page' do
  describe 'I can discover movies' do
    before(:each) do
      @user1 = User.create!(name: 'Mary', email: 'mary@gmail.com')
      @user2 = User.create!(name: 'Larry', email: 'larry@hotmail.com')
      @user3 = User.create!(name: 'Sherri', email: 'sherri@aol.com')

      movie_results = File.read('spec/fixtures/movie_results.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/popular").
      to_return(status: 200, body: movie_results)

      visit "users/#{@user1.id}/movies"
    end

    it 'i should be taken to the movie results page' do

      expect(page).to have_content("The Godfather")

    end

    it 'I see the movie title as a link to the Movie Details page' do

    end
  end
end
