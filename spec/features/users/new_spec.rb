require 'rails_helper'

RSpec.describe 'new user page' do 
  before :each do
    @user1 = User.create!(name: "William", email: "William@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    @user2 = User.create!(name: "Ashley", email: "Ashley@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    @user3 = User.create!(name: "Abdul", email: "Abdul@gmail.com", password: 'pw123', password_confirmation: 'pw123')

    visit "/register"
  end
  describe 'when I visit /register' do 
    it 'i see a form with name and email for new user' do 
      visit "/register"

      expect(page).to have_field("Name")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
    end
    
    it 'I see a button to create new user' do 
      visit "/register"

      fill_in("Name", with: "Naomi")
      fill_in("Email", with: "Naomi@gmail.com")
      fill_in("Password", with: "pw123")
      fill_in("Password", with: "pw123")

      expect(page).to have_button("Register New User")

      click_button("Register New User")

      @user = User.last
      
      expect(current_path).to eq(user_path(@user.id))
    end

    it 'flashes error message when fields are incomplete' do 
      visit "/register"

      fill_in("Name", with: "Naomi")
      fill_in("Email", with: "Naomi@gmail.com")
      fill_in("Password", with: "")
  
      expect(page).to have_button("Register New User")

      click_button("Register New User")
      
      @user = User.last
      
      expect(page).to have_content("Please Fill In Required Fields")
      expect(current_path).to eq(root_path)
    end
  end
end