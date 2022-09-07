require 'rails_helper'

RSpec.describe 'the landing page' do
  it 'has a link to create a new user' do
    visit root_path

    expect(page).to have_link("Create a new User", href: new_user_path)
  end

  it 'has a link to a login page' do
    visit root_path

    expect(page).to have_link("Log In", href: '/login')

    click_link 'Log In'

    expect(current_path).to eq '/login'
  end
end