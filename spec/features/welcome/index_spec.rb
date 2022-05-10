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
      within "#existing_users" do
        expect(page).to have_content("skeeter@example.com")
        expect(page).to have_content("fatdog@corgi.com")
        expect(page).to have_content("hazelthehut@food.com")
      end
    end 

    it 'each existing user links to their respective user dashboard' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')
      lugnut = User.create!(name: 'LugNut', email: 'fatdog@corgi.com')
      hazel = User.create!(name: 'Hazel', email: 'hazelthehut@food.com')
      
      visit "/"

      within "#user-#{skeeter.id}" do 
        expect(page).to have_link("skeeter@example.com's dashboard")
      end 

      within "#user-#{lugnut.id}" do 
        expect(page).to have_link("fatdog@corgi.com's dashboard")
      end 

      within "#user-#{hazel.id}" do 
        expect(page).to have_link("hazelthehut@food.com's dashboard")
        # click_link "hazelthehut@food.com's dashboard"
        # expect(current_path).to eq("/users/#{hazel.id}")
      end 

    end 
  end 
end 