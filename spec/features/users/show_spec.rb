require 'rails_helper'

RSpec.describe 'User Dashbboard', type: :feature do 


    it 'should show the attribtutes of a user' do 
        user_1 = User.create!(name: "Bryan", email: "bryan@bryan.com")
        user_2 = User.create!(name: "Ben", email: "ben@ben.com")

        visit "/users/#{user_1.id}"
        within '#header' do 
            expect(page).to have_content("Bryan")
            expect(page).to_not have_content("bryan@bryan.com")
            expect(page).to_not have_content("Ben")
            expect(page).to_not have_content("ben@ben.com")
        end 
        within '#discover_movies_button' do 
            expect(page).to have_button('Discover Movies')
        end 
    end 
  
    it 'should have a button to discover movies' do 
        user_1 = User.create!(name: "Bryan", email: "bryan@bryan.com")
        user_2 = User.create!(name: "Ben", email: "ben@ben.com")

        visit "/users/#{user_1.id}"


    end 
end 