require 'rails_helper'

RSpec.describe "'/register'", type: :feature do
  describe "When I visit the register page" do
    it "Should have a form to register a new user" do
      visit "/register"
      save_and_open_page
      expect(page).to have_content("Viewing Party")
      expect(page).to have_content("Register a New User")
      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
      expect(page).to have_button("Create New User")

      fill_in :name, with: "David"
      fill_in :email, with: "David@example.com"
      click_button("Create New User")

      expect(current_path).to eq("/users/#{User.last.id}")
      expect(page).to have_content("David's Dashboard")
    end
  end
end