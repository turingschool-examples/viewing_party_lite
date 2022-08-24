require 'rails_helper'

RSpec.describe 'new user registration page', type: :feature do
  
  it 'has a form to create a new user then sends user to show page' do
    user1 = User.create!(name: 'bob', email: 'bob@turing.com') #already 'registered'
    visit register_path
    fill_in :name, with: 'sally' #not registered yet
    fill_in :email, with: 'sally@turing.com'
    click_button 'Register New User' #sally gets registered/created here
    
    expect(page).to have_content('Name: sally') 
    expect(page).to have_content('Email: sally@turing.com') 
    expect(page).to_not have_content('Name: bob') #bob was already registered
    
    expect(current_path).to eq(user_path(User.last.id)) #sallys new show page should be last in User table
    save_and_open_page
  end
end

# When a user visits the '/register' path they should see a form to register.

# The form should include:

#  Name
#  Email (must be unique)
#  Register Button
# Once the user registers they should be taken to a dashboard page '/users/:id', where :id is the id for the user that was just created.