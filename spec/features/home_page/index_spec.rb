require 'rails_helper'

RSpec.describe 'viewing party homepage' do
  let!(:user_1) {User.create!(name: "Alfred", email: "alfred@butler.net", status: 0)}
  let!(:user_2) {User.create!(name: "Bruce", email: "bruced@boss.net", status: 0)}
  let!(:user_3) {User.create!(name: "Oswald", email: "oswald@cobblepot.gotham", status: 0)}

  it 'should display all user emails' do 
    visit "/"

    expect(page).to have_content(user_1.email)
    expect(page).to have_content(user_2.email)
    expect(page).to have_content(user_3.email)
  end

  it 'can click a button to create a new user' do 
    visit "/" 

    click_button "Create a New User" 

    expect(current_path).to eq("/register")
  end
end