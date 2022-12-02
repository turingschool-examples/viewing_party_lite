require 'rails_helper'

RSpec.describe 'Movie Index Page' do
  before(:each) do
    @user1 = User.create!(name: 'Chad', email: 'chad1@gmail.com')
    @user2 = User.create!(name: 'Jessica', email: 'jessica2@gmail.com')
    @user3 = User.create!(name: 'Fiona', email: 'Fiona3@gmail.com')
  end
  
  describe "If the Find Top Rated Movies button is clicked" do
    it 'will have a list of the top 20 movies and their voting average' do
      visit user_discover_path(@user1.id)
      click_button('Find Top Rated Movies')
      expect(current_path).to eq(user_movies_path(@user1.id))

      within('#movie_238') do
        expect(page).to have_content("The Godfather")
        expect(page).to have_content("Vote Average: 8.7")
      end 

      within('#movie_851644') do
        expect(page).to have_content("20세기 소녀")
        expect(page).to have_content("Vote Average: 8.7")
      end 

      expect(page).to have_no_content("Lock, Stock and Two Smoking Barrels")
    end
  end
end