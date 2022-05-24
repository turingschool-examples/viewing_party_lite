require 'rails_helper'


RSpec.describe "Login Page" do

  describe 'Login Featured' do
    it 'clicking link to login, takes me to login page /login', :vcr do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password: 'test123')
      # binding.pry
      visit "/"
      click_button 'Login'
    
      expect(current_path).to eq('/login')
    end
    
    it 'When I enter my email and password correctly I am taken to my dashboard', :vcr do
      meatball = User.create(name: 'meatball', email: 'meatball@example.com', password: '123')

      visit "/login"

      fill_in :name, with: 'meatball'
      fill_in :email, with: 'meatball@example.com'
      fill_in :password, with: '123'
      click_on "Log In"   

      expect(current_path).to eq("/users/#{meatball.id}")
      expect(page).to have_content("Welcome #{meatball.name}!")
    end

    it 'If I enter a bad password, I am redirected back to login page with error telling me my password was bad', :vcr do
      meatball = User.create(name: 'meatball', email: 'meatball@example.com', password: '123')

      visit "/login"

      fill_in :name, with: 'meatball'
      fill_in :email, with: 'meatball@example.com'
      fill_in :password, with: 'not my password'
      click_on "Log In"   
      expect(current_path).to eq("/login")
      # save_and_open_page
      expect(page).to have_content("Incorrect Password")
    end 

    it 'If I enter a bad email, I am redirected back to login page with error telling me my email was bad', :vcr do
      meatball = User.create(name: 'meatball', email: 'meatball@example.com', password: '123')

      visit "/login"

      fill_in :name, with: 'meatball'
      fill_in :email, with: 'skeeter@example.com'
      fill_in :password, with: '123'
      click_on "Log In"   
      expect(current_path).to eq("/login")
      # save_and_open_page
      expect(page).to have_content("Incorrect Email")
    end 


  end 


end 