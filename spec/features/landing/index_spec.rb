require 'rails_helper'

RSpec.describe 'landing page' do 
    it 'has title of application' do
        visit '/'
        expect(page).to have_content("Viewing Party Lite")
    end

    it 'has a button to create a new user' do
        visit '/'
        expect(page).to have_button("Create New User")
    end

    it 'has a button to create a new user that redirects to new form' do
        visit '/'
        click_on "Create New User"
        expect(current_path).to eq("/register")
    end

    it 'has a list of existing users which links to user dashboard' do
        visit '/'
        expect(page).to have_link("Home")
    end

    it 'has a link back to welcome page' do
        visit '/'
        expect(page).to have_link("Home")
    end
   
    it 'lists all users' do
        user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")
        user2 = User.create!(name: "Kobe Bryant", email: "user2@gmail.com")
        user3 = User.create!(name: "Steph Curry", email: "user3@gmail.com")

        visit '/'

        expect(page).to have_content("Micheal Jordan")
        expect(page).to have_content("Kobe Bryant")
        expect(page).to have_content("Steph Curry")
    end
end
