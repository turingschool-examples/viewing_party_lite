require 'rails_helper'

RSpec.describe 'New User Registration' do

  it 'can create new user' do

    visit "/register"

    fill_in 'Name:', with: "Drew"
    fill_in 'Email:', with: "drew@email.com"
    click_button("Create New User")
    user = User.last

    expect(current_path).to eq("/users/#{user.id}")
  end

  it 'cannot create a new user if a name is not input' do

    visit "/register"

    fill_in 'Email:', with: "drew@email.com"
    click_button("Create New User")
    expect(current_path).to eq("/register")

    fill_in 'Name:', with: "Drew"
    fill_in 'Email:', with: "drew@email.com"
    click_button("Create New User")
    user = User.last

    expect(current_path).to eq("/users/#{user.id}")
  end

  it 'cannot create a new user if an email is not input' do

    visit "/register"

    fill_in 'Name:', with: "Drew"
    click_button("Create New User")
    expect(current_path).to eq("/register")

    fill_in 'Name:', with: "Drew"
    fill_in 'Email:', with: "drew@email.com"
    click_button("Create New User")
    user = User.last

    expect(current_path).to eq("/users/#{user.id}")
  end
end
