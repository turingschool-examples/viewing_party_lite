require 'rails_helper'

RSpec.describe 'new user page' do 
  describe 'when I visit /register' do 
    it 'i see a form with name and email for new user' do 
      visit "/register"

      expect(page).to have_field("Name")
      expect(page).to have_field("Email")
    end
    
    it 'I see a button to create new user' do 
      visit "/register"

      fill_in("Name", with: "William")
      fill_in("Email", with: "William@gmail.com")

      expect(page).to have_button("Register New User")

      click_button("Register New User")

      @user = User.last
      
      expect(current_path).to eq(user_path(@user.id))
    end
  end
end