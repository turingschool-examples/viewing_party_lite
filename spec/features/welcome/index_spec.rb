require 'rails_helper'

RSpec.describe 'Landing Page' do
  it 'shows title of app, button to create a user' do
    visit '/'

    expect(page).to have_content('Viewing Party')
    expect(page).to have_button('Create a New User')
  end
end


# When a user visits the root path they should be on the landing page ('/') which includes:

# Title of Application
# Button to Create a New User
# List of Existing Users which links to the users dashboard
# Link to go back to the landing page (this link will be present at the top of all pages)

