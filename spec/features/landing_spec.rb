require 'rails_helper'

RSpec.describe 'the landing page', type: :feature do
  it 'displays name of the app' do
    visit '/'

    expect(page).to have_content("Viewing Party Lite")
  end
end
