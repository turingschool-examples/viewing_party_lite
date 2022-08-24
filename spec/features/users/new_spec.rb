require 'rails_helper'

RSpec.describe 'new user registration page' do 
    it 'has form with name and email' do 
        visit '/register'
        expect(page).to have_field('Email')
        expect(page).to have_field('Name')
        expect(page).to have_button('Submit')
    end
    it 'Once the user registers they should be taken to a dashboard page /users/:id, where :id is the id for the user that was just created.' do
        visit '/register/'
        fill_in :email, with: "sherry@example.com"
        fill_in :name, with: "Sherry"
        click_on "Submit"
        user = User.last
        expect(current_path).to eq("/users/#{user.id}")
    end
end