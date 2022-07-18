require 'rails_helper'

RSpec.describe 'register new user' do

  it "can create a new user" do
    visit '/register'

    expect(page).to have_button("Register New User")

    expect(current_path).to eq('/register')

    fill_in "Name", with: "Lee"
    fill_in "Email", with: "lee@gmail.com"
    fill_in "Username", with: "Leemister420"
    fill_in "Password", with: "Sandsofscarab"

    click_button "Register New User"

    
    user = User.first 
    expect(current_path).to eq("/users/#{user.id}")
    
    expect(user).to be_a(User)
    expect(user.username).to be_a(string)
    expect(page).to have_content("Welcome Leemister420")
  end

end