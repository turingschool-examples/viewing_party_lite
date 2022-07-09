require 'rails_helper'

RSpec.describe "User Movie Results Page", type: :feature do
  before :each do
    @user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com')
    @user2 = User.create!(name: 'Parker', email: 'GriffithDidNothing@Wrong.com')
  end
  describe 'discover movie button' do
    it 'shows movie title and vote average when query is top 20', :vcr do
      visit "/users/#{@user2.id}/discover"

      click_button("Discover Top Rated Movies")

      expect(page.all(".movie").count).to eq(20)
    end

    it 'has links that are movie titles', :vcr do
      visit "/users/#{@user2.id}/discover"

      click_button("Discover Top Rated Movies")

      expect(page).to have_link("The Godfather")
    end

    it 'has movie title links that lead to the correct path', :vcr do
      visit "/users/#{@user2.id}/discover"

      click_button("Discover Top Rated Movies")

      click_link("The Godfather")

      expect(page).to have_current_path("/users/#{@user2.id}/movies/238")
    end
  end
  describe 'search bar' do
    it 'has multiple titles' do
      
    end
  end
end
