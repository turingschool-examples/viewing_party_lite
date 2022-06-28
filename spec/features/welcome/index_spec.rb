require 'rails_helper'

RSpec.describe 'Landing/Welcome Page' do 

  describe 'As a Visitor' do
    before do 
      @skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password: 'test123')
      @lugnut = User.create!(name: 'LugNut', email: 'fatdog@corgi.com', password: 'test12')
      @hazel = User.create!(name: 'Hazel', email: 'hazelthehut@food.com', password: 'test1')
    end 

    it 'has the title of the application, and a list of existing users', :vcr do
      
      visit "/"

      expect(page).to have_content 'Viewing Party' 
    end 
    
    it 'has a link to return back to the landing/welcome page', :vcr do #link will be present on every page of application 
      visit "/"

      click_button "Home"
      expect(current_path).to eq('/')
    end 

    it 'has a button to create a new user' do  
      visit "/"
      
      expect(page).to have_button("Become a User!")
      click_button "Become a User!"
      expect(current_path).to eq('/register')
    end 
  end 
  
  describe 'logging out' do
    it 'landing page no longer has create user or login link if I am already signed in' do
      user1 = User.create!(name: 'Skeeter', email: 'skeeter@skeeter.com', password: 'test')
      visit '/'

      user1 = User.create!(name: 'Skeeter', email: 'skeeter.com', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      visit '/'
     
      expect(page).to_not have_button('Login')
      expect(page).to_not have_button('Create a New User')
      expect(page).to have_link('Log Out')
    end 
    
  end 
  describe 'as a visitor vs as a registered user' do
    it 'as a visitor, I dont see the section listing all the users' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password: 'test123', password_confirmation: 'test123')
      lugnut = User.create!(name: 'LugNut', email: 'fatdog@corgi.com', password: 'test12')
      hazel = User.create!(name: 'Hazel', email: 'hazelthehut@food.com', password: 'test1')
   
      visit '/'
      expect(page).to_not have_content("Current Users")
      expect(page).to_not have_content(skeeter.email)
      expect(page).to_not have_content(lugnut.email)
      expect(page).to_not have_content(hazel.email)
    end 

    it 'As a registered user, I see current users email' do #emails will no longer link to show pages
      lugnut = User.create!(name: 'LugNut', email: 'fatdog@corgi.com', password: 'test12')
      hazel = User.create!(name: 'Hazel', email: 'hazelthehut@food.com', password: 'test1')
      
      user1 = User.create!(name: 'Skeeter', email: 'skeeter.com', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      visit '/'

      expect(page).to have_content("Active Users")
      expect(page).to have_content(lugnut.email)
      expect(page).to have_content(hazel.email)

      expect(page).to_not have_link(lugnut.email)
      expect(page).to_not have_link(hazel.email)
    end 

    it 'Visitor cannot access /dashboard unless logged in' do
      visit '/'
      visit '/dashboard'

      expect(current_path).to eq('/')
      expect(page).to have_content("You must log in or regiester to access your dashboard")
    end 

  end 

end 