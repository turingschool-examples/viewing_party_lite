require 'rails_helper'

RSpec.describe 'landing page' do
  it 'displays title of app' do
    visit '/'

    expect(page).to have_content('Welcome to Viewing Party Lite!')
  end

  it 'has button to create new user' do
    visit '/'

    click_on "create new user"

    expect(current_path).to eq("/users/new")
  end
end
