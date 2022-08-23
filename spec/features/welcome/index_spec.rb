require 'rails_helper'

RSpec.describe 'landing page' do
  describe '#index' do
    it 'displays the title of the application' do
 
      visit '/'

      expect(page).to have_content('Viewing Party Lite')
    end

    it 'has button to create a new user' do

      visit '/'

      expect(page).to have_button('Create New User')
    end
    
    it 'click button to redirect to new user registration form' do

      visit '/'

      click_button('Create New User')

      expect(current_path).to eq('/register')
    end

    it 'displays all exisiting users by email address' do
      user_1 = User.create!(name: 'Cindy Lou', email: 'cidlou@gmail.com')
      user_2 = User.create!(name: 'David Smith', email: 'daves@gmail.com')
      user_3 = User.create!(name: 'Mary Jones', email: 'maryjonesu@gmail.com')

      visit '/'
      
      within "#users0" do
        expect(page).to have_content("cidlou@gmail.com's Dashboard")
        expect(page).to_not have_content("daves@gmail.com's Dashboard")
      end

      within "#users1" do
        expect(page).to have_content("daves@gmail.com's Dashboard")
        expect(page).to_not have_content("maryjonesu@gmail.com's Dashboard")
      end

      within "#users2" do
        expect(page).to have_content("maryjonesu@gmail.com's Dashboard")
        expect(page).to_not have_content("cidlou@gmail.com's Dashboard")
      end
    end
  end
end