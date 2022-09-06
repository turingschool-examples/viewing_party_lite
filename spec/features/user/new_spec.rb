require 'rails_helper'

describe 'Create a New User' do
  it "should be able to create a new user" do

    user1 = User.create!(name: "bob", email: "bob@gmail.com", password: "password123")
    user2 = User.create!(name: "tom", email: "tom@gmail.com", password: "password123")

    visit '/register'

    expect(page).to have_content("Register A New User")

    fill_in :name, with: 'Dave'
    fill_in :email, with: 'daveisnotdave32@gmail.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'

    click_button 'Create New User'

  end
  it "should not be able to create a new user" do

    user1 = User.create!(name: "bob", email: "bob@gmail.com", password: "password123")
    user2 = User.create!(name: "tom", email: "tom@gmail.com", password: "password123")

    visit '/register'

    expect(page).to have_content("Register A New User")

    fill_in :name, with: 'Dave'
    fill_in :email, with: 'tom@gmail.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'

    click_button 'Create New User'

    expect(current_path).to eq '/register'
    expect(page).to have_content("User Has Not Been Created!")

  end

  it 'must have matching passwords' do
    visit '/register'

    expect(page).to have_content("Register A New User")

    fill_in :name, with: 'Dave'
    fill_in :email, with: 'daveisnotdave32@gmail.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password456'

    click_button 'Create New User'

    expect(current_path).to eq '/register'
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
