require 'rails_helper'

RSpec.describe 'User Dashbboard', type: :feature do

    it 'should show the attribtutes of a user' do
        user_1 = User.create!(name: "Bryan", email: "bryan@bryan.com", password: '123456', password_confirmation: '123456')
        user_2 = User.create!(name: "Ben", email: "ben@ben.com", password: '123456', password_confirmation: '123456')

        visit "users/#{user_1.id}"

        within '#header' do
            expect(page).to have_content("Bryan")
            expect(page).to_not have_content("bryan@bryan.com")
            expect(page).to_not have_content("Ben")
            expect(page).to_not have_content("ben@ben.com")
        end
    end

    it 'should have a section that lists viewing parties' do
      user_1 = User.create!(name: "Bryan", email: "bryan@bryan.com", password: '123456', password_confirmation: '123456')
      user_2 = User.create!(name: "Ben", email: "ben@ben.com", password: '123456', password_confirmation: '123456')
      party_1 = Party.create!(user_id: user_1.id, duration: 20, when: '2022-08-22', start_time: '12:00', movie_id: 520)
      party_2 = Party.create!(user_id: user_2.id, duration: 30, when: '2022-08-20', start_time: '13:00', movie_id: 300)
      party_3 = Party.create!(user_id: user_1.id, duration: 40, when: '2022-08-24', start_time: '14:00', movie_id: 300)

      user_1.user_parties.create!(party_id: party_1.id, user_id: user_1.id)
      user_1.user_parties.create!(party_id: party_3.id, user_id: user_1.id)

      visit "users/#{user_1.id}"

      within '#hosted-parties' do
        expect(page).to have_content('2022-08-22')
        expect(page).to have_content('2022-08-24')
        expect(page).to_not have_content('2022-08-20')

        expect(page).to have_content('12:00')
        expect(page).to_not have_content('13:00')
        expect(page).to have_content('14:00')
      end
    end

    it 'should redirect to the user discover page after the Discover Movies button has been clicekd' do
        user_1 = User.create!(name: "Bryan", email: "bryan@bryan.com", password: '123456', password_confirmation: '123456')

        visit "users/#{user_1.id}"

        click_button 'Discover Movies'

        expect(current_path).to eq("/users/#{user_1.id}/discover")
    end
end
