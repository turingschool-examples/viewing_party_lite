require 'rails_helper'

RSpec.describe 'New User Registration Page' do

  before do
    visit '/register'
  end

  it 'can create new user' do
    fill_in 'Name:', with: "Drew"
    fill_in 'Email:', with: "drew@email.com"
    fill_in 'Password:', with: "password123"
    fill_in 'Confirm Your Password:', with: "password123"
    click_button("Create New User")
    user = User.last

    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Welcome, #{user.name}")
  end

  it 'cannot create a new user if a name is not input' do
    fill_in 'Email:', with: "drew@email.com"
    fill_in 'Password:', with: "password123"
    fill_in 'Confirm Your Password:', with: "password123"
    click_button("Create New User")
    expect(page).to have_content("#{["Name can't be blank"]}")
    expect(current_path).to eq("/register")

    fill_in 'Name:', with: "Drew"
    fill_in 'Email:', with: "drew@email.com"
    fill_in 'Password:', with: "password123"
    fill_in 'Confirm Your Password:', with: "password123"
    click_button("Create New User")
    user = User.last

    expect(current_path).to eq("/users/#{user.id}")
  end

  it 'cannot create a new user if an email is not input' do
    fill_in 'Name:', with: "Drew"
    fill_in 'Password:', with: "password123"
    fill_in 'Confirm Your Password:', with: "password123"
    click_button("Create New User")
    expect(page).to have_content("#{["Email can't be blank"]}")
    expect(current_path).to eq("/register")

    fill_in 'Name:', with: "Drew"
    fill_in 'Email:', with: "drew@email.com"
    fill_in 'Password:', with: "password123"
    fill_in 'Confirm Your Password:', with: "password123"
    click_button("Create New User")
    user = User.last

    expect(current_path).to eq("/users/#{user.id}")
  end

  it 'cannot create a new user if a password and password confirmation do not match' do
    fill_in 'Name:', with: "Drew"
    fill_in 'Email:', with: "drew@email.com"
    fill_in 'Password:', with: "password123"
    fill_in 'Confirm Your Password:', with: "password124"
    click_button("Create New User")
    expect(page).to have_content("#{["Password confirmation doesn't match Password"]}")
    expect(current_path).to eq("/register")

    fill_in 'Name:', with: "Drew"
    fill_in 'Email:', with: "drew@email.com"
    fill_in 'Password:', with: "password123"
    fill_in 'Confirm Your Password:', with: "password123"
    click_button("Create New User")
    user = User.last

    expect(current_path).to eq("/users/#{user.id}")
  end

  it 'cannot create a new user without a password and password confirmation' do
    fill_in 'Name:', with: "Drew"
    fill_in 'Email:', with: "drew@email.com"
    click_button("Create New User")
    expect(page).to have_content("#{"Password can't be blank"}")
    expect(page).to have_content("#{"Password digest can't be blank"}")
    expect(current_path).to eq("/register")

    fill_in 'Name:', with: "Drew"
    fill_in 'Email:', with: "drew@email.com"
    fill_in 'Password:', with: "password123"
    fill_in 'Confirm Your Password:', with: "password123"
    click_button("Create New User")
    user = User.last

    expect(current_path).to eq("/users/#{user.id}")
  end
end
