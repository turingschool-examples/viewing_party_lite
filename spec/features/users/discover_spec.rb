require 'rails_helper'

RSpec.describe 'Discover Movies Page' do
  before(:each) do
    @user1 = User.create!(name: 'Chad', email: 'chad1@gmail.com')
    @user2 = User.create!(name: 'Jessica', email: 'jessica2@gmail.com')
    @user3 = User.create!(name: 'Fiona', email: 'Fiona3@gmail.com')
  end

  describe "Discover Movie Page Layout" do
    it 'should have a button to discover top rated movies' do
      visit user_discover_path(@user1.id)

      within '#discover-top-rated-movies' do
        expect(page).to have_button('Find Top Rated Movies')
      end
    end

    it 'should have a text field to enter keyword(s) to search by movie title, and a 
      Search By Movie Title button' do
        visit user_discover_path(@user1.id)

        within('#search-by-movie-title') do
          expect(page).to have_field(:q)
          expect(page).to have_button('Search by Movie Title')
        end
    end

    it "if the 'Find Top Rated Movies' Button is clicked, the user should be directed
      to the user_movies path" do
        visit user_discover_path(@user1.id)
        click_button("Find Top Rated Movies")
        expect(current_path).to eq(user_movies_path(@user1.id))
    end 
  end 

  describe "Search for Movies function" do
    describe "happy path" do
      it "if the search field is filled out with a valid movie title, the Search by Movie Title
        button is clicked, the user will be redirected to the movie Index page" do
          visit user_discover_path(@user1.id)
          fill_in :q, with: "Godfather"
          click_button("Find Top Rated Movies")
          expect(current_path).to eq(user_movies_path(@user1.id))
      end 
    end 
  end 
end