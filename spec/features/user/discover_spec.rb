require 'rails_helper'

RSpec.describe "The User's Discover Movies Page", type: :feature do
  describe 'dashboard' do
    it 'has VPL title and discover movies at the top' do
      user = User.create!(name: "Rand", email: "randalthor@gmail.com")

      visit "/users/#{user.id}"
      click_button "Discover Movies"

      expect(current_path).to eq("/users/#{user.id}/discover")
      expect(page).to have_content("Viewing Party Lite")
      expect(page).to have_content("Discover Movies")
    end
  end
end
