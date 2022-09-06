require 'rails_helper'

describe 'User log in' do
  it "should be able to log in" do

    user1 = User.create!(name: "bob", email: "bob@gmail.com", password: "password123")

    visit '/login'

    expect(page).to have_content("User Log In")

    fill_in :name, with: 'bob'
    fill_in :password, with: 'password123'


    click_button 'Log In'

    expect(current_path).to eq user_path(User.last.id)
  end

  it "must have valid name" do

    user1 = User.create!(name: "bob", email: "bob@gmail.com", password: "password123")

    visit '/login'

    expect(page).to have_content("User Log In")

    fill_in :name, with: 'Dave'
    fill_in :password, with: 'password123'


    click_button 'Log In'

    expect(current_path).to eq '/login'
    expect(page).to have_content("Sorry, your credentials are bad.")

  end

  it "must have a valid pasword" do

    user1 = User.create!(name: "bob", email: "bob@gmail.com", password: "password123")

    visit '/login'

    expect(page).to have_content("User Log In")

    fill_in :name, with: 'bob'
    fill_in :password, with: 'password456'


    click_button 'Log In'

    expect(current_path).to eq '/login'
    expect(page).to have_content("Sorry, your credentials are bad.")

  end
end
