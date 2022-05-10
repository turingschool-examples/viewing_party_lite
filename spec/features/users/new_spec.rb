require "rails_helper"

RSpec.describe "users#new" do
  it "creates a new user" do
    visit root_path

    within(".users") do
      expect(page).to_not have_content("Fake Joe")
    end

    click_link "Create New User"

    fill_in "Name", with: "Fake Joe"
    fill_in "Email", with: "imnotreal@unreal.org"
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
    User.create!(name: "Duplicate Debby", email: "123@abc.com")

    visit "/register"

    fill_in "Name", with: "Fake Joe"
    fill_in "Email", with: "123@abc.com"
    click_button "Register"

    expect(current_path).to eq("/register")
    expect(page).to have_content("That email has already been registered. Please enter a new email.")
  end
end
