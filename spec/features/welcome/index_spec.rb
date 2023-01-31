require 'rails_helper'
# When a user visits the root path they should be on the landing page ('/') which includes:
# Title
# button for new user
# list of existing users which links to the users dashboard
# link to go back to the landing page(this shows on every page)
RSpec.describe 'Landing Page' do
  it 'displays title of application' do
    visit root_path

    expect(page).to have_content('Viewing Party Lite')
  end

  it 'displays button to create new user' do
    visit root_path

    expect(page).to have_button('Create a New User')

    click_button('Create a New User')

    expect(current_path).to eq('/register')
  end

  it 'displays list of existing users which links to the users dashboard' do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)

    visit root_path

    within '#existing-users' do
      expect(page).to have_link(user1.email)
      expect(page).to have_link(user2.email)
      expect(page).to have_link(user3.email)

      click_link(user1.email)
    end

    expect(current_path).to eq("/users/#{user1.id}")
  end
end