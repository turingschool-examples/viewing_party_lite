require 'rails_helper'

RSpec.describe 'the new user view' do
  it 'has a form to register a new user' do
    visit register_path

    fill_in 'Email', with: 'NewUserOne@gmail.com'
    fill_in 'Name', with: 'Terry Crews'

    click_on 'Register'

    expect(current_path).to eq(user_dashboard_path(User.first))
    expect(User.first.name).to eq('Terry Crews')
  end

  it 'will not register an invalid user' do
    visit register_path

    fill_in 'Email', with: ''
    fill_in 'Name', with: ''

    click_on 'Register'

    within '.flash' do
      expect(page).to have_content('Invalid Entry')
    end

    within '.error-messages' do
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Email can't be blank")
    end
  end
end
