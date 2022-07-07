require 'rails_helper'

RSpec.describe "User Index Page", type: :feature do
  describe "landing page" do
    it "has the title of the application and exists as our landing page" do
      visit '/'

      expect(page).to have_content("Viewing Party Lite")
    end

    it "has a button to create a new user" do
      visit root_path

      click_button "Create a New User"

      expect(current_path).to eq("/register")
    end

    it "has a list of existing users as links to the user dashboard"

    it "has a link to go back to the landing/user index page"
  end
end
