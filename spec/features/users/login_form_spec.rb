require 'rails_helper'

RSpec.describe 'users login page' do
    it "can login with a unique email and password" do
        user_2 = User.create!(name: 'Nick', email: 'testemail4@email.com', password: 'test123' )
        visit "/login"
        expect(page).to have_content('email')
        expect(page).to have_content('Password:')

        fill_in('email', with: 'testemail4@email.com')
        fill_in :password, with: ("test123")
        click_on('Log In')
        expect(current_path).to eq("/users/#{user_2.id}")
    end

    it "can sad path for a wrong password" do 
        user_2 = User.create!(name: 'Nick', email: 'testemail4@email.com', password: 'test123' )
        visit "/login"
        expect(page).to have_content('email')
        expect(page).to have_content('Password:')

        fill_in('email', with: 'testemail4@email.com')
        fill_in :password, with: "password1"
        click_on('Log In')
        expect(current_path).to eq("/login")
        expect(page).to have_content("Sorry, your credentials are bad.")
    end
end

# As a registered user
# When I visit the landing page `/`
# I see a link for "Log In"
# When I click on "Log In"
# I'm taken to a Log In page ('/login') where I can input my unique email and password.
# When I enter my unique email and correct password 
# I'm taken to my dashboard page