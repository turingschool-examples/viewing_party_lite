require 'rails_helper'

RSpec.describe 'landing page' do 
    it 'has title of application' do
        visit '/'
        expect(page).to have_content("Viewing Party Lite")
    end

    it 'has a link to register a new user' do
        visit '/'
        expect(page).to have_link("Register as a User")
    end

    it 'link to register new user redirects to register form' do
        visit '/'
        click_link"Register as a User"
        expect(current_path).to eq("/users/new")
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
        user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com", password: "123test")
        user2 = User.create!(name: "Kobe Bryant", email: "user2@gmail.com", password: "123test")
        user3 = User.create!(name: "Steph Curry", email: "user3@gmail.com", password: "123test")

        visit '/'

        expect(page).to have_content("Micheal Jordan")
        expect(page).to have_content("Kobe Bryant")
        expect(page).to have_content("Steph Curry")
    end
end
