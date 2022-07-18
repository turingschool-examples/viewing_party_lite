require 'rails_helper'

RSpec.describe 'register new user' do

  it "can create a new user" do
    visit '/register'

    expect(page).to have_button("Register New User")

    expect(current_path).to eq('/register')

    fill_in "Name", with: "Lee"
    fill_in "Email", with: "lee@gmail.com"
    fill_in :username, with: "Leemister420"
    fill_in "Password", with: "Sandsofscarab"
    fill_in "Password Confirmation", with: "Sandsofscarab"

    click_button "Register New User"
    
    expect(page).to have_content("Welcome, Leemister420")
    
    user = User.first 
    expect(current_path).to eq("/users/#{user.id}")
    
    expect(user).to be_a(User)
    expect(user.username).to be_a(String)
  end

  describe 'sad path' do
    it "can create a new user" do
      visit '/register'

      expect(page).to have_button("Register New User")

      expect(current_path).to eq('/register')

      fill_in "Name", with: "Lee"
      fill_in "Email", with: "lee@gmail.com"
      fill_in :username, with: "Leemister420"
      fill_in "Password", with: "Sandsofscarab"
      fill_in "Password Confirmation", with: "Sandsofscrappy"

      click_button "Register New User"

      expect(page).to have_content("Password confirmation doesn't match")
    end
  end

  describe 'sadder path' do
    it "can create a new user" do
      @user_same_email = User.create!(email: 'lee@gmail.com', name: 'Jake', username: 'jakeypoo', password:'54321')
      visit '/register'

      expect(page).to have_button("Register New User")

      expect(current_path).to eq('/register')

      fill_in "Name", with: "Lee"
      fill_in "Email", with: "lee@gmail.com"
      fill_in :username, with: "Leemister420"
      fill_in "Password", with: "Sandsofscarab"
      fill_in "Password Confirmation", with: "Sandsofscarab"

      click_button "Register New User"

      expect(page).to have_content("Email has already been taken")
    end
  end

    describe 'saddest path' do
    it "can create a new user" do
     
      visit '/register'

      expect(page).to have_button("Register New User")

      expect(current_path).to eq('/register')

      fill_in "Name", with: ""
      fill_in "Email", with: "lee@gmail.com"
      fill_in :username, with: "Leemister420"
      fill_in "Password", with: "Sandsofscarab"
      fill_in "Password Confirmation", with: "Sandsofscarab"

      click_button "Register New User"

      expect(page).to have_content("Name can't be blank")
    end
  end

end