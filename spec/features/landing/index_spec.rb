require 'rails_helper'

RSpec.describe 'landing page', type: :feature do

  it 'has a landing page with title of application' do
    visit '/'

    expect(page).to have_content("Viewing Party Lite")
  end

end