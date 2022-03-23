require 'rails_helper'

RSpec.describe 'user create page' do
  before(:each) do
    visit "/register"
  end
  describe "when a user visits the user create page" do
    scenario "they see a form to create a new user, when filled out it redirects to landing page with user listed" do
      fill_in :name, with: "Paul"
      fill_in :email, with: "paul@fake.com"
      click_button "Register"

      expect(current_path).to eq("/")
      expect(page).to have_content("Paul")
      expect(User.last.email).to eq("paul@fake.com")
    end

    scenario "they see a form to create a new user, gives error when not unique email" do
      fill_in :name, with: "Paul"
      fill_in :email, with: "paul@fake.com"
      click_button "Register"

      visit '/register'
      fill_in :name, with: "Paul"
      fill_in :email, with: "paul@fake.com"
      click_button "Register"
      expect(page).to have_content("Error: Email already registered")
      expect(current_path).to eq('/register')
    end
  end
end
