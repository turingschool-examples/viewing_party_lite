require 'rails_helper'

RSpec.describe 'landing page' do
    it 'has a button to create a new user' do
        visit "/"

        expect(page).to have_button("Create a New User")
    end

    it 'the button links to page to create a new user' do
        visit "/"
        click_on("Create a New User")

        expect(current_path).to eq("/users/new")
    end

    it 'has a list of existing users' do
        user_1 = User.create!(name: "Mike", email: "email@email.com")

        visit "/"
        
        within("#existing-users") do
            expect(page).to have_content("email@email.com's Dashboard")
        end
    end
end