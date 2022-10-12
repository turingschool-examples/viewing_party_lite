require 'rails_helper'

RSpec.describe 'Landing Page' do 
  describe 'when a user visits the root path' do
    it 'displays the title of the app, existing users, with links to users dashboard' do
      users = create_list(:random_user, 3)
      #   When a user visits the root path they should be on the landing page ('/') which includes:
      visit '/'
      # _Title of Application
      expect(page).to have_content('Viewing Party Lite')
      # _Button to Create a New User
      expect(page).to have_button('Create New User')
      # _List of Existing Users which links to the users dashboard
      expect(page).to have_link("#{users[0].email}'s dashboard")
      # _Link to go back to the landing page (this link will be present at the top of all pages)
      expect(page).to have_link('Home')
    end
  end
end