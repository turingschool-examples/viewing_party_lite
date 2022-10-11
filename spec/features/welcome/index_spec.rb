require 'rails_helper'

RSpec.describe "Welcome Index", type: :feature do
    before :each do
        @user_1 = create(:user)
        @user_2 = create(:user)
        @user_3 = create(:user)

        visit root_path
    end
    
    it 'shows title of app' do
        expect(page).to have_content('Viewing Party Lite')
    end

    it 'has a button to create a new user' do
        click_button 'New User'
        expect(current_path).to eq(register_path)
    end

    it 'has a list of existing users and links to the dashboard of each user' do
        expect(page).to have_link("#{@user_1.name}'s Dashboard")
        expect(page).to have_link("#{@user_2.name}'s Dashboard")
        expect(page).to have_link("#{@user_3.name}'s Dashboard")
        click_link "#{@user_3.name}'s Dashboard"
        expect(current_path).to eq(user_path(@user_3))
    end

    it 'has a link to landing page' do
        expect(page).to have_link('Home')
        click_link 'Home'
        expect(current_path).to eq(root_path)
    end
end