require 'rails_helper'

RSpec.describe 'Landing Page' do
    before :each do
        @jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com')
        @amy = User.create!(name: 'Amy Adams', email: 'amy.adams@gmail.com')
        @quincy = User.create!(name: 'Quincy Jones', email: 'quincy.jones@gmail.com')

        visit landing_index_path
    end

    it 'displays the name of the app' do
        expect(page).to have_content('Welcome to Viewing Party Lite')
    end

    it 'displays all current users' do
        expect(page).to have_content('Jose Andres')
        expect(page).to have_content('Amy Adams')
        expect(page).to have_content('Quincy Jones')
    end

    it 'has links to user dashboards' do
        click_link('Jose Andres')
        expect(current_path).to eq(user_path(@jose))   
    end

    it 'has a button to create a new user' do
        click_button 'New User'
        expect(current_path).to eq(users_path)
    end

    it 'has link to return to landing page' do
        expect(page).to have_link('Landing')
        click_link 'Landing'
        expect(current_path).to eq(landing_index_path)
    end
end