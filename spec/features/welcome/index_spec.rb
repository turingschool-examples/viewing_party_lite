require 'rails_helper'

RSpec.describe 'Landing/Welcome Page' do 

  describe 'As a Visitor' do
    before do 
      @skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password_digest: 'test123', password_confirmation: 'test123')
      @lugnut = User.create!(name: 'LugNut', email: 'fatdog@corgi.com', password_digest: 'test12', password_confirmation: 'test12')
      @hazel = User.create!(name: 'Hazel', email: 'hazelthehut@food.com', password_digest: 'test1', password_confirmation: 'test1')
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
        click_link "hazelthehut@food.com's dashboard"
        expect(current_path).to eq("/users/#{@hazel.id}")
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
      expect(current_path).to eq('/register')
    end 
  end 

  # describe 'Login Featured' do
  #   it 'clicking link to login, takes me to login page /login' do
  #     skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password_digest: 'test123', password_confirmation: 'test123')
  #     visit "/"
  #     click_button 'Login'
    
  #     expect(current_path).to eq('/login')
  #   end
    
  #   it 'When I enter my email and password correctly I am taken to my dashboard' do
  #     meatball = User.create!(name: 'meatball', email: 'meatball@example.com', password_digest: '123', password_confirmation: '123')
  #     # binding.pry
  #     visit "/login"

  #     fill_in :name, with: 'meatball'
  #     fill_in :email, with: 'meatball@example.com'
  #     fill_in :password, with: '123'
  #     fill_in :password_confirmation, with: '123'


  #     click_on "Log In"   

  #     expect(current_path).to eq("/users/#{meatball.id}")
  #     expect(page).to have_content("Welcome #{meatball.name}!")
  #   end


  # end 
end 