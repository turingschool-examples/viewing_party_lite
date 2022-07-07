require 'rails_helper'

RSpec.describe 'Discover Index Page' do
  describe "button link paths" do
    before :each do
      @user  = User.create!(name: 'Drewb', email: 'Drew@testemail.com')
    end

    it "has a button to discover top rated movies", :vcr do
      visit "users/#{@user.id}/discover"

      expect(page).to have_button("Discover Top Rated Movies")

      click_button("Discover Top Rated Movies")

      expect(current_path).to eq("/users/#{@user.id}/movies?q=top%20rated")
    end

    it "has a search field to find movies by title", :vcr do
      visit "users/#{@user.id}/discover"

      fill_in "search", with: "Shaw"
      click_button("Search")

      expect(current_path).to eq("/users/#{@user.id}/movies?q=Shaw")
    end
  end
end
