require 'rails_helper'

RSpec.describe 'Movie Show page' do
  describe 'movie details' do
    before :each do
      @user1 = User.create!(name: 'Jim Bob', email: 'jimb@viewingparty.com')
      @user2 = User.create!(name: 'Cary Berry', email: 'caryb@viewingparty.com')
    end

    it 'has the movie title', :vcr do
      # VCR.use_cassette("has_the_movie_title") do
        @movie = MovieFacade.movie_details(49022)
        # binding.pry
      # json_response = File.read("spec/fixtures/movie.json")
      # binding.pry
      # stub_request(:get, "https://api.themoviedb.org/3/movie/49022").
      # with(
      #   params: { 'api_key' => ENV['api_key']
      #   }).
      #   to_return(status:200, body: json_respose, params: {})
      # binding.pry
      visit "/users/#{@user1.id}/movies/#{@movie.id}"
      expect(page).to have_content("Something Borrowed")
    end
    end
  end
