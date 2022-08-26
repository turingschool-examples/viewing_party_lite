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

    it 'has a button to the discover page', :vcr do
      @movie = MovieFacade.movie_details(49022)
      visit "/users/#{@user1.id}/movies/#{@movie.id}"
      expect(page).to have_button("Discover Movies")
    end

    it 'has a button to create a viewing party', :vcr do
      @movie = MovieFacade.movie_details(49022)
      visit "/users/#{@user1.id}/movies/#{@movie.id}"

      expect(page).to have_button("Create a Viewing Party")
    end

    it 'shows movie attributes', :vcr do
      @movie = MovieFacade.movie_details(49022)
      visit "/users/#{@user1.id}/movies/#{@movie.id}"

      expect(page).to have_content("Something Borrowed")
      expect(page).to have_content("6.3")
      expect(page).to have_content("Summary: Though Rachel is a successful attorney and a loyal, generous friend, she is still single. After one drink too many at her 30th-birthday celebration, Rachel unexpectedly falls into bed with her longtime crush, Dex -- who happens to be engaged to her best friend, Darcy. Ramifications of the liaison threaten to destroy the women's lifelong friendship, while Ethan, Rachel's confidant, harbors a potentially explosive secret of his own.")
        expect(page).to have_content(900)
    end

    it 'shows the movies cast', :vcr do
      @movie = MovieFacade.cast(49022)
      visit "/users/#{@user1.id}/movies/#{@movie.id}"
    end
  end
end
