require 'rails_helper'

RSpec.describe 'the new user view' do
  it 'has a form to register a new user' do
    visit register_path

    fill_in 'Email', with: 'NewUserOne@gmail.com'
    fill_in 'Name', with: 'Terry Crews'
    fill_in 'Password', with: 'password123'
    fill_in 'Password confirmation', with: 'password123'

    click_on 'Register'
    new_user = User.last

    expect(current_path).to eq(user_dashboard_path(new_user))
    expect(new_user.name).to eq('Terry Crews')
  end

  it 'will not register an invalid user' do
    visit register_path

    fill_in 'Email', with: ''
    fill_in 'Name', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''

    click_on 'Register'

    within '.flash' do
      expect(page).to have_content('Invalid Entry')
    end

    within '.error-messages' do
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
    end
  end
end
