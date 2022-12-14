require 'rails_helper'

RSpec.describe 'User can log out' do
  it 'can log out' do
    user = create(:user)
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Log In'

    visit root_path

    expect(page).to_not have_content('Log In')
    expect(page).to_not have_content('Create a New User')

    click_on 'Log Out'
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Log In')
    expect(page).to have_selector(:link_or_button, 'Create a New User')
    expect(page).to_not have_content('Log Out')
  end
end