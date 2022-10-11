require 'rails_helper'

RSpec.describe "New User Page", type: :feature do
  before :each do
    visit register_path
  end

  it 'has a form to create a new user' do
    fill_in :user_name, with: "Benji"
    fill_in :user_email, with: "benji_the_dog@aol.com"
    click_button "Register"
    benji = User.last

    expect(benji.name).to eq("Benji")
    expect(current_path).to eq(user_path(benji.id))
  end

  it 'validates uniqueness of email address' do
    user = create(:user, email: "user@gmail.com")
    fill_in :user_name, with: "Benji"
    fill_in :user_email, with: "user@gmail.com"
    click_button "Register"

    expect(page).to have_content("Email has already been taken")
    expect(User.last).to eq(user)
  end

  it 'validates presence of name and email' do
    click_button "Register"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(User.last).to be nil
  end

  it 'validates format of email address' do
    fill_in :user_name, with: "Benji"
    fill_in :user_email, with: "user.gmail.com"
    click_button "Register"

    expect(page).to have_content("Email is not formatted correctly")
    expect(User.last).to be nil
  end
end