require 'rails_helper'

RSpec.describe "register" do
  it 'registers a new users name and email' do
    visit '/register'

    expect(page).to have_content("Viewing Party Lite")
    expect(page).to have_content("Register a New User")

    fill_in :name, with: "Mallory Vining"
    fill_in :email, with: "eurotrashdemon@gmail.com"

    click_button "Create New User"

    expect(current_path).to eq("/users/#{User.last.id}")
  end

  it 'only works if forms are correct' do
    visit '/register'

    expect(page).to have_content("Viewing Party Lite")
    expect(page).to have_content("Register a New User")

    fill_in :name, with: "Mallory Vining"
    fill_in :email, with: nil

    click_button "Create New User"
    expect(current_path).to eq(new_user_path)
    save_and_open_page
    expect(page).to have_content("This user could not be created. Please check your form.")
  end
end
# When a user visits the '/register' path they should see a form to register.
# The form should include:
#  Name
#  Email (must be unique)
#  Register Button
# Once the user registers they should be taken to a dashboard page '/users/:id',
# where :id is the id for the user that was just created.
