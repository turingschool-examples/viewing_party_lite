require 'rails_helper'
#sessions_challenge
RSpec.describe 'Sessions' do 
  it "can log in as a user" do 
    user = User.create!(name: "Bob", email: "bob@bob.com", password: "123test")

    visit "/login"

    fill_in :email, with: user.email 
    fill_in :name, with: user.name 
    fill_in :password, with: user.password 

    click_button "Log In"

    expect(current_path).to eq("/users/#{user.id}")
  end

  it "can log out as a user" do 
    user = User.create!(name: "Bob", email: "bob@bob.com", password: "123test")

    visit "/login"

    fill_in :email, with: user.email 
    fill_in :name, with: user.name 
    fill_in :password, with: user.password 

    click_button "Log In"

    expect(current_path).to eq("/users/#{user.id}")

    click_link "Home"

    expect(current_path).to eq("/")
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Log In")
  end
end