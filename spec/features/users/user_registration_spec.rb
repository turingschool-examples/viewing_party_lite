# frozen_string_literal: true

require 'rails_helper'

# When a user visits the '/register' path they should see a form to register.
#
# The form should include:
#
#  Name
#  Email (must be unique)
#  Register Button
# Once the user registers they should be taken to a dashboard page '/users/:id', where :id is the id for the user that was just created.

RSpec.describe 'user registration' do
  it 'Can create a new user' do
    visit '/register'

    fill_in 'name', with: 'Ana'
    fill_in 'Email', with: 'anita@hotmail.com'
    click_on 'Submit'

    ana = User.last
    expect(current_path).to eq("/users/#{ana.id}")
  end
end
