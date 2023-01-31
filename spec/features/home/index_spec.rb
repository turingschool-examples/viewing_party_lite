require 'rails_helper'

RSpec.describe "index page" do
  describe "page title" do
    it 'The title of the application' do
      visit root_path

      expect(page).to have_content("Viewing Party")
    end
  end

  describe "Create new user button" do
    it 'has a button to create a new user' do
      visit root_path

      expect(page).to have_button("Create New User")
    end

    it 'will load the New User Page' do
      visit root_path

      expect(current_path).to eq(root_path)

      click_button "Create New User"

      expect(current_path).to eq(register_path)
    end
  end
end