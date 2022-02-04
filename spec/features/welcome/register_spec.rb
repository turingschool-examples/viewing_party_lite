require 'rails_helper'

RSpec.describe 'Welcome Register Page' do
  describe 'register view page' do
    it 'has a home link which takes the user back to the home page' do
      visit "/register"

      click_link('Home')
      expect(current_path).to eq(root_path)
    end
    it "displays headers" do
      visit "/register"
      expect(page).to have_content ("Viewing Party Lite")
      expect(page).to have_content ("Create a New User")
    end

    it 'has a form that is filled out and takes you to new user show page' do
      visit "/register"

      fill_in('Name', with: 'Marco Polo')
      fill_in('Email', with: "Marco_polo@gmail.com")

      click_button('Submit')

      last = User.all.last
      expect(current_path).to eq("/users/#{last.id}")
    end
    it "render flash message" do
      visit "/register"

      fill_in('Name', with: 'Marco Polo')

      click_button('Submit')

      expect(page).to have_content("Error: Name can't be blank, Email can't be blank and must be valid.")

      expect(current_path).to eq("/register")
    end
  end
end
