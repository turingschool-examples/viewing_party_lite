require 'rails_helper'

RSpec.describe 'Landing/Welcome Page' do 

  describe 'As a Visitor' do
    before do 
      @skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')
      @lugnut = User.create!(name: 'LugNut', email: 'fatdog@corgi.com')
      @hazel = User.create!(name: 'Hazel', email: 'hazelthehut@food.com')
    end 

    it 'has the title of the application, and a list of existing users' do
      
      visit "/"

      expect(page).to have_content 'Viewing Party Lite'
      
      within "#existing_users" do
        expect(page).to have_content("skeeter@example.com")
        expect(page).to have_content("fatdog@corgi.com")
        expect(page).to have_content("hazelthehut@food.com")
      end
    end 

    it 'each existing user links to their respective user dashboard' do
      
      visit "/"
      within "#user_id-#{@skeeter.id}" do 
        expect(page).to have_link("skeeter@example.com's dashboard")
      end 
      
      within "#user_id-#{@lugnut.id}" do 
        expect(page).to have_link("fatdog@corgi.com's dashboard")
      end 
      
      within "#user_id-#{@hazel.id}" do 
        expect(page).to have_link("hazelthehut@food.com's dashboard")
        # click_link "hazelthehut@food.com's dashboard"
        # expect(current_path).to eq("/users/#{hazel.id}")
      end 
    end 
    
    it 'has a link to return back to the landing/welcome page' do #link will be present on every page of application
      
      visit "/"

      click_link "Home"
      expect(current_path).to eq('/')
    end 

    it 'has a button to create a new user' do 
      
      visit "/"
      
      expect(page).to have_button("Create a New User")
      click_button "Create a New User"
      expect(current_path).to eq('/users/new')
    end 
  end 
end 