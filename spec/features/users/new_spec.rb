require 'rails_helper'

RSpec.describe 'register new user' do

  it "can create a new user" do
    visit '/'
    expect(page).to have_button("Create New User")
    click_button "Create New User"
    expect(current_path).to eq('/register')
    # save_and_open_page

    fill_in "name", with: "Lee"
    fill_in "email", with: "lee@gmail.com"
    fill_in "password", with: "Sandsofscarab"
    fill_in "password_confirmation", with: "Sandsofscarab"

    click_button "Register"
    
    expect(page).to have_content("Welcome, lee@gmail.com")
    
    user = User.first 
    expect(current_path).to eq("/users/#{user.id}")
    
    expect(user).to be_a(User)
  end

  describe 'sad path' do
    it "can create a new user" do
      visit '/register'

      expect(page).to have_button("Register")

      expect(current_path).to eq('/register')

      fill_in "name", with: "Lee"
      fill_in "email", with: "lee@gmail.com"
      fill_in "password", with: "Sandsofscarab"
      fill_in "password_confirmation", with: "Sandsofscrappy"

      click_button "Register"

      expect(page).to have_content("Password confirmation doesn't match")
    end
  end

  describe 'sadder path' do
    it "can create a new user" do
      @user_same_email = User.create!(email: 'lee@gmail.com', name: 'Jake', password:'54321')
      visit '/register'

      expect(page).to have_button("Register")

      expect(current_path).to eq('/register')

      fill_in "name", with: "Lee"
      fill_in "email", with: "lee@gmail.com"
      fill_in "password", with: "Sandsofscarab"
      fill_in "password_confirmation", with: "Sandsofscarab"

      click_button "Register"

      expect(page).to have_content("Email has already been taken")
    end
  end

    describe 'saddest path' do
    it "can create a new user" do
     
      visit '/register'

      expect(page).to have_button("Register")

      expect(current_path).to eq('/register')

      fill_in "name", with: ""
      fill_in "email", with: "lee@gmail.com"
      fill_in "password", with: "Sandsofscarab"
      fill_in "password_confirmation", with: "Sandsofscarab"

      click_button "Register"

      expect(page).to have_content("Name can't be blank")
    end
  end

end