require 'rails_helper'

RSpec.describe 'Landing/Welcome Page' do 

  describe 'As a Visitor' do

    it 'has the title of the application, button to create a new user, and a list of existing users' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')
      lugnut = User.create!(name: 'LugNut', email: 'fatdog@corgi.com')
      hazel = User.create!(name: 'Hazel', email: 'hazelthehut@food.com')
      
      visit "/"

      expect(page).to have_content 'Viewing Party Lite'
      expect(page).to have_button 'Create a New User'
      
      within("#existing_users") do
        expect(page).to have_content("Skeeter")
        expect(page).to have_content("LugNut")
        expect(page).to have_content("Hazel")
      end
    end 
  end 
end 