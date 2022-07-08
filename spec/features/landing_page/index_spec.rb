require 'rails_helper'

RSpec.describe LandingPage: :Index do
  it 'has a landing page with a title' do
    visit root_path

    expect(page).to have_content('Viewing Party!!(lite)')
  end

  it 'contains a link to register for the service' do
    visit root_path

    expect(page).to have_button('Create an Account')

    click_on('Create an Account')

    expect(current_path).to eq('/register')
  end
end
