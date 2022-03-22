require 'rails_helper'

RSpec.describe 'create a new user', type: :feature do
  it 'has a registration page' do
    visit "/register"
    expect(current_path).to eq("/register")
    expect(page).to have_content("New User Registration")
  end

  describe 'happy path:' do
    it 'new user form' do
      visit "/register"
      fill_in("Name", with: "Biff Bliffert")
      fill_in("Email", with: "biff@bliffertsolutions.biz")
      click_button("Register")
      user = User.last
      expect(current_path).to eq("/users/#{user.id}")
      expect(user.name).to eq("Bliff Bliffert")
      expect(user.email).to eq("biff@bliffertsolutions.biz")
    end
  end

  describe 'sad paths:' do
    it 'email address is not unique' do
      user = User.create(name: "Jill Jillian", email: "jill@gmail.com")
      visit "/register"
      fill_in("Name", with: "Jill Jillian")
      fill_in("Email", with: "jill@gmail.com")
      click_button("Register")
      expect(current_path).to eq("/register")
      expect(page).to have_content("Error: ")
    end
  end
end
