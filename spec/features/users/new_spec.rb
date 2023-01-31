require 'rails_helper'

RSpec.describe 'user registration page' do
  before :each do
    # When a user visits the '/register' path they should see a form to register.
    User.delete_all
    
    # @user = create(:user)
    
    visit register_path
  end
  
  it 'has a form to create a new user' do
    # When a user visits the '/register' path they should see a form to register.
    expect(page).to have_field('Name')
    expect(page).to have_field('Email')
    expect(page).to have_link_or_button('Submit')
  end
  
  xit 'can be filled in and submitted' do
    fill_in('Name', with: 'Jeff Goldblum')
    fill_in('Email', with: 'JurassicSnark@gmail.com')
    click_on 'Submit'
    
    expect(current_path).to eq(user_path)
  end
  # When a user visits the '/register' path they should see a form to register.
  # 
  # The form should include:
  # 
  # - Name
  # - Email (must be unique)
  # - Register Button
  # 
  # Once the user registers they should be taken to a dashboard page '/users/:id', where :id is the id for the user that was just created.
end
