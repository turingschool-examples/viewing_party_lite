require "rails_helper"

RSpec.describe "users#new" do
  it "creates a new user" do
    visit root_path

    within(".users") do
      expect(page).to_not have_content("Fake Joe")
    end

    click_link "Create New User"

    fill_in :user_name, with: "Fake Joe"
    fill_in :user_email, with: "goldfish@fishilike.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_button "Register"

    user = User.where(name: "Fake Joe").first
    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Fake Joe")

    visit root_path

    within(".users") do
      expect(page).to have_content("Fake Joe")
    end
  end

  it "requires unique email" do
    User.create!(name: "Duplicate Debby", email: "123@abc.com", password: "password123", password_confirmation: "password123")

    visit "/register"

    fill_in "Name", with: "Fake Joe"
    fill_in "Email", with: "123@abc.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_button "Register"

    expect(current_path).to eq("/register")
    expect(page).to have_content("Email has already been taken")
  end

  it "requires matching passwords" do
    visit "/register"

    fill_in "Name", with: "Fake Joe"
    fill_in "Email", with: "123@abc.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "zzzzz"
    click_button "Register"
    
    expect(current_path).to eq("/register")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
