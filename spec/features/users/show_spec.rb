require 'rails_helper'

RSpec.describe 'The User Dashboard page', type: :feature do
  describe 'the user show page' do

    let!(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:user3) { create(:user) }
    let!(:invited_party1) { create(:viewing_party, movie_id: 13)}
    let!(:invited_party2) { create(:viewing_party, movie_id: 14)}
    let!(:hosted_party1) { create(:viewing_party, host: user, movie_id: 15)}
    let!(:hosted_party2) { create(:viewing_party, host: user, movie_id: 17)}
    let!(:vpu1){ create(:viewing_party_user, user: user, viewing_party: invited_party1) }
    let!(:vpu2){ create(:viewing_party_user, user: user, viewing_party: invited_party2) }
    let!(:vpu3){ create(:viewing_party_user, user: user2, viewing_party: invited_party2) }
    let!(:vpu4){ create(:viewing_party_user, user: user3, viewing_party: invited_party2) }
    let!(:vpu5){ create(:viewing_party_user, user: user2, viewing_party: hosted_party1) }
    let!(:vpu6){ create(:viewing_party_user, user: user3, viewing_party: hosted_party2) }

    before :each do
      visit user_path(user)
    end

    it 'displays the users name in the title' do
      expect(page).to have_content "#{user.name}'s Dashboard"
    end

    it 'has a button to Discover Movies' do
      expect(page).to have_button "Discover Movies" 

      click_button "Discover Movies"

      expect(current_path).to eq discover_user_path(user)
    end

    describe 'viewing parties' do
      it 'lists all viewing parties the user has been invited to with their data' do
        invited_parties = user.invited_parties
        within "#invited_parties" do
          invited_parties.each do |party|
#            src = party.movie.image_path
            within "#invited_#{party.id}" do
              expect(page).to have_content "Movie Title: #{party.movie.title}"
              expect(page).to have_link "#{party.movie.title}"
              expect(page.find('img')[:src]).to eq party.movie.image_path 
              expect(page).to have_content "Date of Event: #{party.date}"
              expect(page).to have_content "Start Time: #{party.start_time}"
              expect(page).to have_content "Host: #{party.host.name}"
              party.users.each do |invitee|
                expect(page).to have_content invitee.name
              end
              page.html.should include("<b>#{user.name}</b>")
            end
          end
        end
      end

      it 'lists all viewing parties the user has hosted' do
        hosted_parties = user.hosted_parties
        within "#hosted_parties" do
          hosted_parties.each do |party|
            within "#hosted_#{party.id}" do
              expect(page).to have_content "You are the host of this viewing party."
              expect(page).to have_content "Movie Title: #{party.movie.title}"
              expect(page).to have_link "#{party.movie.title}"
              expect(page.find('img')[:src]).to eq party.movie.image_path 
              expect(page).to have_content "Date of Event: #{party.date}"
              expect(page).to have_content "Start Time: #{party.start_time}"
              party.users.each do |invitee|
                expect(page).to have_content invitee.name
              end
            end
          end
        end
      end
    end
  end
end
