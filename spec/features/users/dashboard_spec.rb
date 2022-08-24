require 'rails_helper'

RSpec.describe 'User Dashboard' do
  context 'user discover movie button' do
    it 'has a button to discover movies' do
      @user1 = User.create!(name: "Jim Bob", email: "jimb@viewingparty.com")
      @user2 = User.create!(name: "Cary Berry", email: "caryb@viewingparty.com")

      visit user_path(@user1.id)

      expect(page).to have_content("Jim Bob's Dashboard")
      expect(page).to_not have_content("Cary Berry's Dashboard")
      expect(page).to have_selector(:link_or_button, "Discover Movies")
    end

    it 'can take you to the discover movie page from a users dashboard' do
      @user1 = User.create!(name: "Jim Bob", email: "jimb@viewingparty.com")

      visit user_path(@user1.id)

      curr_path = user_discover_path(@user1.id)

      click_on "Discover Movies"

      expect(page).to have_current_path(curr_path)
      expect(page).to have_content("Discover Movies")
      expect(page).to have_field(:search, with: 'Search by movie title')
      expect(page).to have_selector(:link_or_button, 'Find Movies')
    end
  end
end