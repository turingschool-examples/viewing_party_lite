require 'rails_helper'

RSpec.describe 'new user party page', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the new user party page (/users/:user_id/movies/:movid_id/viewing-party/new) ' do

      it 'I can click create a viewing party and be brough to the right page', :vcr do
        user = create(:user)
        visit "/users/#{user.id}/movies/550"
        click_button('Create a Viewing Party')

        expect(current_path).to eq("/users/#{user.id}/movies/550/viewing-party/new")
      end 

      it 'I should see the name of the movie title rendered above a form with the following fields: duration with default value, date, start time, checkboxes next to each user we want to invite and a create party button', :vcr do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user4 = create(:user)
        user5 = create(:user)

        visit "/users/#{user1.id}/movies/550/viewing-party/new"
        expect(page).to have_content('Duration:')
        expect(page).to have_content('Date:')
        expect(page).to have_content('Start Time:')
        save_and_open_page
        within('#potential_invitees') do
          expect(page).to have_content("#{user5.name}")
          expect(page).to have_content("#{user4.name}")
          expect(page).to have_content("#{user3.name}")
          expect(page).to have_content("#{user2.name}")
          expect(page).to_not have_content("#{user1.name}")
        end
        #<div id='order_<%=order.id %>'> #change to doublequotes
        #end the div before the iteration ends
      end

      xit 'a viewing party should NOT be created if set to a value less than the duration of the movie', :vcr do

        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user4 = create(:user)
        user5 = create(:user)

        visit "/users/#{user1.id}/movies/550/viewing-party/new"
        fill_in(:duration, with: 2000)
        fill_in(:date, with: "date")
        fill_in(:start_time, with: "7pm")
        within('#potential_invitees') do
          click_on(user2)
          click_on(user3)
        end
        #<div id='order_<%=order.id %>'> #change to doublequotes
        #end the div before the iteration ends
        expect(current_path).to eq("/users/#{user1.id}/movies/550/viewing-party/new")
        expect(page).to have_content("error message details")
      end


      xit "When the party is created, the user should be redirected back to the dashboard where the new event is shown. The event should also be listed on any other user's dashbaords that were also invited to the party.", :vcr do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user4 = create(:user)
        user5 = create(:user)

        visit "/users/#{user1.id}/movies/550/viewing-party/new"
        fill_in(:duration, with: 2000)
        fill_in(:date, with: "date")
        fill_in(:start_time, with: "7pm")
        within('#potential_invitees') do
            click_on(user2)
            click_on(user3)
          end
        expect(current_path).to eq(user_path(user1))
        expect(page).to have_content("Fight Club")
        visit user_path(user2)
        expect(page).to have_content('Fight Club')
      end

    end
  end
end

