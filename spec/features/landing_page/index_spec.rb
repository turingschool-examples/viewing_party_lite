require 'rails_helper'

RSpec.describe LandingPage: :Index do
  it 'has a landing page' do
    visit '/'

    expect(page).to have_content('Viewing Party!!(lite)')
  end
end
