require 'rails_helper'

RSpec.describe "New User Page" do
  before :each do
    visit new_users_dashboard_path
  end

  it 'contains a form to create a new user and redirects to their show page' do
    fill_in "Name", with: "John Cena"
    fill_in "Email", with: "youcantseeme@email.com"
    click_button "Submit"
    
    user = User.find_by(name: "John Cena")

    expect(current_path).to eq(users_dashboard_path(user))
  end

  it 'will not accept a user name already in the system' do
    user = User.create!(name: "Bob", email: "bob@email.com")
    visit new_users_dashboard_path

    fill_in "Name", with: "John Cena"
    fill_in "Email", with: "bob@email.com"
    click_button "Submit"

    expect(page).to have_content("Error: All fields must be complete and email must be unique")
    expect(current_path).to eq(new_users_dashboard_path)
  end

  it 'form requires all fields to be filled' do
    fill_in "Name", with: ""
    fill_in "Email", with: "bob@email.com"
    click_button "Submit"

    expect(page).to have_content("Error: All fields must be complete and email must be unique")
    expect(current_path).to eq(new_users_dashboard_path)
  end
end