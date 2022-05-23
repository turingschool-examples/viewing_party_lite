require 'rails_helper'


RSpec.describe "Login Page" do

  describe 'Login Featured' do
    it 'clicking link to login, takes me to login page /login' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password_digest: 'test123', password_confirmation: 'test123')
      # binding.pry
      visit "/"
      click_button 'Login'
    
      expect(current_path).to eq('/login')
    end
    
    it 'When I enter my email and password correctly I am taken to my dashboard' do
      meatball = User.create(name: 'meatball', email: 'meatball@example.com', password: '123')

      visit "/login"

      fill_in :name, with: 'meatball'
      fill_in :email, with: 'meatball@example.com'
      fill_in :password, with: '123'



      click_on "Log In"   

      expect(current_path).to eq("/users/#{meatball.id}")
      expect(page).to have_content("Welcome #{meatball.name}!")
    end


  end 


end 