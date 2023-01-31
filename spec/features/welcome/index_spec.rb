require 'rails_helper'

RSpec.describe 'Landing Page' do
  it 'shows title of app, button to create a user' do
    visit '/'

    expect(page).to have_content('Viewing Party')
    expect(page).to have_button('Create a New User')
  end

  it 'lists existing users with links to user dashboard' do
    user1 = User.create!(name: 'John Doe', email: 'john@doe.com')
    user2 = User.create!(name: 'Jane Smith', email: 'jane@gmail.com')
    
    visit '/'

    expect(page).to have_content('Existing Users:')
    save_and_open_page
    within '#existing_users' do
      expect(page).to have_link('john@doe.com', href: user_path(user1))      
      expect(page).to have_link('jane@gmail.com', href: user_path(user2))      
    end
  end
end


# When a user visits the root path they should be on the landing page ('/') which includes:

# Title of Application
# Button to Create a New User
# List of Existing Users which links to the users dashboard
# Link to go back to the landing page (this link will be present at the top of all pages)

