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

      expect(page).to have_content 'Viewing Party Lite'
      
      # within "#existing_users" do
      #   expect(page).to have_content("skeeter@example.com")
      #   expect(page).to have_content("fatdog@corgi.com")
      #   expect(page).to have_content("hazelthehut@food.com")
      # end
    end 

    # it 'each existing user links to their respective user dashboard', :vcr do
      
    #   visit "/"
    #   within "#user_id-#{@skeeter.id}" do 
    #     expect(page).to have_link("skeeter@example.com's dashboard")
    #   end 
      
    #   within "#user_id-#{@lugnut.id}" do 
    #     expect(page).to have_link("fatdog@corgi.com's dashboard")
    #   end 
      
    #   within "#user_id-#{@hazel.id}" do 
    #     expect(page).to have_link("hazelthehut@food.com's dashboard")
    #     # click_link "hazelthehut@food.com's dashboard"
    #     # expect(current_path).to eq("/users/#{@hazel.id}")
    #   end 
    # end 
    
    it 'has a link to return back to the landing/welcome page', :vcr do #link will be present on every page of application 
      visit "/"

      click_link "Home"
      expect(current_path).to eq('/')
    end 

    it 'has a button to create a new user' do  
      visit "/"
      
      expect(page).to have_button("Create a New User")
      click_button "Create a New User"
      expect(current_path).to eq('/register')
    end 
  end 
  describe 'logging out' do
    it 'landing page no longer has create user or login link if I am already signed in' do
      user1 = User.create!(name: 'Skeeter', email: 'skeeter@skeeter.com', password: 'test')
      visit '/'

      click_button 'Login'
      fill_in 'Name:', with: 'Skeeter'
      fill_in 'Email:', with: 'skeeter@skeeter.com'
      fill_in 'Password', with: 'test'
      click_on 'Log In'
      visit '/'
      # save_and_open_page
      expect(page).to_not have_button('Login')
      expect(page).to_not have_button('Create a New User')
      expect(page).to have_button('Log Out')
    end 
    
    it 'clicking log out logs out user, returns them to root, buttons to log in/create user appear' do
      user1 = User.create!(name: 'Skeeter', email: 'skeeter@skeeter.com', password: 'test')
      visit '/'

      click_button 'Login'
      fill_in 'Name:', with: 'Skeeter'
      fill_in 'Email:', with: 'skeeter@skeeter.com'
      fill_in 'Password', with: 'test'
      click_on 'Log In'
      visit '/'

      click_button 'Log Out'
      expect(page).to have_button('Login')
      expect(page).to have_button('Create a New User')
      expect(page).to_not have_button('Log Out')
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

  end 

end 