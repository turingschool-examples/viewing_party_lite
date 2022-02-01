require 'rails_helper'

RSpec.describe 'viewing party homepage' do
  let!(:user_1) {User.create!(name: "Alfred", email: "alfred@butler.net", status: 0)}
  let!(:user_2) {User.create!(name: "Bruce", email: "bruced@boss.net", status: 0)}
  let!(:user_3) {User.create!(name: "Oswald", email: "oswald@cobblepot.gotham", status: 0)}

  it 'should display all user emails' do 
    visit "/"

    expect(page).to have_link("#{user_1.email}'s Dashboard")
    expect(page).to have_link("#{user_2.email}'s Dashboard")
    expect(page).to have_link("#{user_3.email}'s Dashboard")
  end

  it 'can click the user email link and be taken to the users dashboard page' do
    visit "/"

    click_link "#{user_1.email}'s Dashboard"

    expect(current_path).to eq(user_path(user_1))
  end

  it 'can click a button to create a new user' do 
    visit "/" 

    click_button "Create a New User" 

    expect(current_path).to eq("/register")
  end

  it 'can click the home link to be taken back to the home page' do 
    visit "/"

    click_link "Home" 
    
    expect(current_path).to eq("/")
  end
end