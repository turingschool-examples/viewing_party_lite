require 'rails_helper'
require 'faker'

RSpec.describe 'user creation' do
  describe 'the user registration' do
    it 'renders the new form' do
      visit "/register"
      
      expect(page).to have_content('Register a New User')
      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Email')
      expect(page).to have_button('Create New User')
    end

    it 'creates the user and redirects to the user show page' do
      visit "/register"
      random_name = Faker::Name.name
      random_email = Faker::Internet.email

      fill_in 'Name', with: random_name
      fill_in 'Email', with: random_email

      click_button 'Create New User'

      expect(page).to have_current_path("/users/#{User.first.id}")
    end
  end
end 
# When a user visits the '/register' path they should see a form to register.

# The form should include:

#  Name
#  Email (must be unique)
#  Register Button
# Once the user registers they should be taken to a dashboard page '/users/:id', where :id is the id for the user that was just created.