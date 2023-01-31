require 'rails_helper'

RSpec.describe 'User Registration Page' do
  it 'has a form with fields for name and email' do
    visit register_path

    expect(page).to have_field(:user_name)
    expect(page).to have_field(:user_email)
    expect(page).to have_button('Register')

    fill_in :user_name, with: "Mike"
    fill_in :user_email, with: "mike@mike.com"
    click_button 'Register'
    user = User.last

    expect(current_path).to eq(user_path(user.id))
  end

  it 'only allows unique email addresses' do
    user_1 = User.create!(name: "Mike", email: "mike@mike.com")

    visit register_path

    fill_in :user_name, with: "Mike2"
    fill_in :user_email, with: "mike@mike.com"
    click_button 'Register'

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Email is already taken")
    expect(User.all).to eq([user_1])
  end
end