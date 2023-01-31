require 'rails_helper'

RSpec.describe 'landing page' do
  before :each do
    visit welcome_index_path
  end

  it 'has the title of the application' do
    expect(page).to have_content("Viewing Party Lite")
  end

  it 'has a button to create a new user' do
    click_button("Create User")

    expect(current_path).to eq(new_user_path)
  end

  it 'list of Existing Users which links to the users dashboard' do
    user1 = User.create!(email: "john@email.com", name: "John Cena")
    user2 = User.create!(email: "Phil@email.com", name: "Phil Jones")

    visit welcome_index_path

    within "div#user_#{user1.id}" do
      expect(page).to have_link(user1.name, href: user_path(user1))
    end

    within "div#user_#{user2.id}" do
      expect(page).to have_link(user2.name, href: user_path(user2))
    end
  end

  it 'has a link to go back to the landing page' do
    expect(page).to have_link("Home", href: welcome_index_path)
  end
end




# When a user visits the root path they should be on the landing page ('/') which includes:
# Title of Application
# Button to Create a New User
# List of Existing Users which links to the users dashboard
# Link to go back to the landing page (this link will be present at the top of all pages)