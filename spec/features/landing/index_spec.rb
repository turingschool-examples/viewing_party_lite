require 'rails_helper'

RSpec.describe 'landing page', type: :feature do

  it 'has a landing page with title of application' do
    visit '/'

    expect(page).to have_content("Viewing Party Lite")
  end

  it 'has button to create new user' do
    visit '/'

    click_on "Create a New User"

    expect(current_path).to eq("/register")
  end

end