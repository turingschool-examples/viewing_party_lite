require 'rails_helper'

RSpec.describe 'new viewing party page', :vcr, type: :feature do
  describe 'as as user' do
    describe 'when I visit new_viewing_party_path(user, movie.id)' do
      it 'the form creates a new party' do
        VCR.use_cassette("new_party", :allow_playback_repeats => true) do
          user = create(:user, id: 50, name: "Bubbles", email: "bubbles@sunnyvale.ca")
          visit "/users/#{user.id}/movies/550/viewing_party/new"
          fill_in "Day", with: Date.today
          fill_in "Start Time", with: Time.now
  
          expect { click_on 'Create Party' }.to change { Party.count }.by(1)
          party = Party.first
  
          expect(party.duration).to eq(220)
          expect(party.date).to eq(Date.today)
          expect(party.movie_id).to eq(550)
        end
      end
    end
  
    describe 'UserParty creation' do
      it 'creates new user parties for all invited users when the form is submitted' do
        VCR.use_cassette("new_party", :allow_playback_repeats => true) do
          host = create(:user, id: 50, name: "Bubbles", email: "bubbles@sunnyvale.ca")
          guest_1 = create(:user, id: 51, name: "Julian", email: "julian@sunnyvale.ca")
          guest_2 = create(:user, id: 53, name: "Jim Lahey", email: "supervisor@sunnyvale.ca")
          guest_3 = create(:user, id: 54, name: "Ricky", email: "ricky@sunnyvale.ca")
          visit "/users/#{host.id}/movies/550/viewing_party/new"
          
          fill_in "Day", with: Date.today
          fill_in "Start Time", with: Time.now
    
          check("added_users_51")
          check("added_users_53")
         
          expect { click_on 'Create Party' }.to change { UserParty.count }.by(3)
          host_up = UserParty.first
          invitee = UserParty.last
  
          expect(host_up.user_status).to eq("host")
          expect(invitee.user_status).to eq("invited")
          expect(host_up.user_id).to eq(host.id)
          expect(invitee.user_id).to eq(guest_2.id)
          expect(host_up.party_id).to eq(invitee.party_id)
        end
      end
  
      it 'adds the new user parties to the user dashboards and redirects to host dashboard' do
        VCR.use_cassette("new_party", :allow_playback_repeats => true) do
          host = create(:user, id: 50, name: "Bubbles", email: "bubbles@sunnyvale.ca")
          guest_1 = create(:user, id: 51, name: "Julian", email: "julian@sunnyvale.ca")
          guest_2 = create(:user, id: 53, name: "Jim Lahey", email: "supervisor@sunnyvale.ca")
          guest_3 = create(:user, id: 54, name: "Ricky", email: "ricky@sunnyvale.ca")
          visit "/users/#{host.id}/movies/550/viewing_party/new"
          
          fill_in "Day", with: Date.today
          fill_in "Start Time", with: Time.now
        
          check("added_users_51")
          check("added_users_53")
  
          click_on "Create Party"
          
          expect(current_path).to eq(user_path(host.id))
          expect(page).to have_content("host")
  
          visit user_path(guest_2.id)
          expect(page).to have_content("Fight Club")
          expect(page).to have_content("invited")
        end
      end
    end
  end
end