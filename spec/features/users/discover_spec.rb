require 'rails_helper'

RSpec.describe 'Discover page' do
  context 'discover movies search' do
    it 'goes to the search & redirects back to discover' do
      @user1 = User.create!(name: "Jim Bob", email: "jimb@viewingparty.com")

      curr_path = user_discover_path(@user1.id)

      visit user_discover_path(@user1.id)

      fill_in "Search", with: "something"

      click_on "Find Movies"

      expect(page).to have_current_path(curr_path)

      within "#movie-0" do
        expect(page).to have_content("Something Borrowed")
      end
    end

    it 'has a button to discover top rated movies' do
      @user1 = User.create!(name: "Jim Bob", email: "jimb@viewingparty.com")

      visit user_discover_path(@user1.id)

      expect(page).to have_selector(:link_or_button, "Find Top Rated Movies")

      click_on("Find Top Rated Movies")

      expect(current_path).to eq("/users/#{@user1.id}/movies")
    end
  end
end