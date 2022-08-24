require 'rails_helper'

RSpec.describe 'User Dashbboard', type: :feature do 

    it 'should show the attribtutes of a user' do 
        user_1 = User.create!(name: "Bryan", email: "bryan@bryan.com")
        user_2 = User.create!(name: "Ben", email: "ben@ben.com")

        visit "users/#{user_1.id}"

        within '#header' do 
            expect(page).to have_content("Bryan")
            expect(page).to_not have_content("bryan@bryan.com")
            expect(page).to_not have_content("Ben")
            expect(page).to_not have_content("ben@ben.com")
        end 
    end 
   
    it 'should have a section that lists viewing parties' do 
        user_1 = User.create!(name: "Bryan", email: "bryan@bryan.com")
        # user_2 = User.create!(name: "Ben", email: "ben@ben.com")
        # user_3 = User.create!(name: "Drew", email: "drew@drew.com")
        
        party_1 = Party.create!(user_id: user_1.id, duration: 20, when: Time.parse("2022.08.23 12:00"), start_time: Time.parse("2022.08.23 12:00"), movie_id: 520)
        party_2 = Party.create!(user_id: user_1.id, duration: 20, when: Time.parse("2022.08.27 13:00"), start_time: Time.parse("2022.08.27 13:00"), movie_id: 300)
    end 

    it 'should redirect to the user discover page after the Discover Movies button has been clicekd' do 
        user_1 = User.create!(name: "Bryan", email: "bryan@bryan.com")
        
        visit "users/#{user_1.id}"

        click_button 'Discover Movies'

        expect(current_path).to eq("/users/#{user_1.id}/discover")
        
    end 
end 