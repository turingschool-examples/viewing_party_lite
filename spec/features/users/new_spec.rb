require 'rails_helper'

RSpec.describe 'register page' do
  # When a user visits the '/register' path they should see a form to register.
  # The form should include:
  #  Name
  #  Email (must be unique)
  #  Register Button
  # Once the user registers they should be taken to a dashboard page '/users/:id', where :id is the id for the user that was just created.
  it 'allows a user to create a registration and redirects to their page' do

    visit '/registration'

    expect(page).to have_content("Name")
    expect(page).to have_content("Email")
    expect(page).to have_button("Register")

    fill_in "Name", with: "Sam Smith"
    fill_in "Email", with: "ssmith22@gmail.com"
    click_button "Register"
    expect(current_path).to eq("/users/#{User.last.id}")
  end
end
