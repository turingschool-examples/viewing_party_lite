require 'rails_helper'

RSpec.describe 'Welcome Index Page' do
  describe 'view' do
    it 'has a home link which takes the user back to the home page' do
      visit root_path

      click_link('Home')
      expect(current_path).to eq(root_path)
    end

    it 'displays the title of the application' do
      visit root_path

      expect(page).to have_content("Viewing Party Lite")
    end

    it 'includes a button to create a new user' do
      visit root_path

      click_link('Create a New User')
      expect(current_path).to eq("/register")

      fill_in :name, with: 'Wade'
      fill_in :email, with: 'Wade@email.com'
      click_button 'Submit'

      expect(page).to have_content("Wade")
    end

    it 'lists the existing users which link to their dashboard' do
      user_1 = User.create!(name: "David", email: "david@email.com")
      user_2 = User.create!(name: "Wade", email: "wade@email.com")
      user_3 = User.create!(name: "Robin", email: "robin@email.com")

      visit root_path

      within "#user-#{user_1.id}" do
        expect(page).to have_link("#{user_1.name}")
        click_link("#{user_1.name}")
      end

      expect(current_path).to eq("/users/#{user_1.id}")
    end
  end
end
