require 'rails_helper'

RSpec.describe 'landing page' do
  describe 'when a user visits the root path' do
    it 'has the Viewing Party title' do
      visit root_path

      expect(page).to have_content 'Viewing Party'
    end

    it 'has a button to create a new user' do
      visit root_path

      click_button 'Create a New User'

      expect(current_path).to eq register_path
      expect(page).to have_content 'Register New User'
    end

    it 'has links of all existing users' do
      charlie = User.create!(name: 'Charlie', email: 'charlie_boy@gmail.com')
      nicole = User.create!(name: 'Nicole', email: 'nicoley_oley@yahoo.com')
      sara = User.create!(name: 'Sara', email: 'sara1983@gmail.com')

      visit root_path

      within '#users' do
        expect(page).to have_link(charlie.email)
        expect(page).to have_link(nicole.email)
        expect(page).to have_link(sara.email)
      end

      within "#user_#{charlie.id}" do
        click_link charlie.email
        expect(current_path).to eq user_path(charlie)
      end

      visit root_path

      within "#user_#{nicole.id}" do
        click_link nicole.email
        expect(current_path).to eq user_path(nicole)
      end
    end

    it 'has a link to go to the landing page' do
      visit root_path

      click_link 'Home'

      expect(current_path).to eq root_path
    end
  end
end
