require 'rails_helper'

RSpec.describe 'welcome index page' do
  before :each do
    @user1 = User.create!(name: "William", email: "William@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    @user2 = User.create!(name: "Ashley", email: "Ashley@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    @user3 = User.create!(name: "Abdul", email: "Abdul@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    visit login_path
  end

  it 'when I have successful login credentials, I am taken to my user dashboard' do 
    fill_in("Email", with: "William@gmail.com")
    fill_in("Password", with: "pw123")
    click_button "Log In"
    expect(current_path).to eq(user_path(@user1.id))
  end
  
  it 'sad path, when i dont fill out required info, i am not logged in' do 
    fill_in("Email", with: "William@gmail.com")
    fill_in("Password", with: "pw456")
    click_button "Log In"

    expect(page).to have_content("Invalid login.")
    expect(current_path).to eq(login_path)
  end

  describe 'as a logged in user when I visit the landing page' do 
    it 'i no longer see a link to log in or create an account' do 
      visit '/'

      click_link("Login")

      fill_in("Email", with: "William@gmail.com")
      fill_in("Password", with: "pw123")
      click_button "Log In"

      visit '/'

      click_link("Log Out")

      expect(current_path).to eq('/')

      expect(page).to have_link('Login')
      expect(page).to_not have_link('Log Out')
    end
  end
end 