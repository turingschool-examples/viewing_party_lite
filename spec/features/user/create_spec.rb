require 'rails_helper'

RSpec.describe 'Creating a new user:', type: :feature do

  it "has stuff on the page" do
    visit '/register'
    expect(page).to have_content("Name")
    expect(page).to have_content("Email")
    expect(page).to have_button("Save")
  end

  it 'happy path' do
    visit '/register'
    fill_in("Name", with: "Bliffert Blankship")
    fill_in("Email", with: "Bliff@aol.com")
    click_button("Save")

    expect(current_path).to eq("/users/#{User.last.id}")
    expect("#{User.last.name}").to eq("Bliffert Blankship")
  end

  it ' sad- does not create user if Name empty' do
    visit '/register'

    fill_in("Email", with: "Bliff@aol.com")
    click_button("Save")
    expect(current_path).to eq('/register')
    expect(page).to have_content("Error: Name can't be blank")
  end

  it ' sad- does not create user if email empty' do
    visit '/register'

    fill_in("Name", with: "Bliffert's Blankship")
    click_button("Save")
    expect(current_path).to eq('/register')
    expect(page).to have_content("Error: Email can't be blank")
  end
end
