require 'rails_helper'

RSpec.describe 'user login page' do
  let!(:user_1) { User.create!(name: 'Alfred', email: 'alfred@butler.net', status: 0, password: 'mastermind123', password_confirmation: 'mastermind123') }
  let!(:user_2) { User.create!(name: 'Bruce', email: 'bruced@boss.net', status: 0, password: 'batcave123', password_confirmation: 'batcave123') }
  let!(:user_3) { User.create!(name: 'Oswald', email: 'oswald@cobblepot.gotham', status: 0, password: 'penguin123', password_confirmation: 'penguin123') }

  describe 'happy path' do 
    it 'can allow a user to successfully login' do 
      visit '/login' 

      fill_in :email, with: 'oswald@cobblepot.gotham'
      fill_in :password, with: 'penguin123'

      click_button "Login"

      expect(current_path).to eq(user_path(user_3))
    end
  end

  describe 'sad path' do 
    it 'wont login user without proper password' do 
      visit '/login' 

      fill_in :email, with: 'oswald@cobblepot.gotham'
      fill_in :password, with: 'penguin'
      
      click_button "Login" 
      
      expect(current_path).to eq('/login')
    end

    it 'wont login user without proper email' do 
      visit '/login' 

      fill_in :email, with: 'oz@cobblepot.gotham'
      fill_in :password, with: 'penguin123'
      
      click_button "Login" 
      
      expect(current_path).to eq('/login')
    end 
  end
end